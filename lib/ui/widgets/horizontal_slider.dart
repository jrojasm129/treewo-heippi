import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalSlider extends StatefulWidget {
  final List<Widget> children;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final double activeDotSize;
  final double inactiveDotSize;
  final double viewportfraction;
  final bool dotsOnTop;
  final CrossAxisAlignment dotsCrossAxisAlignment;
  final double height;
  final double width;


  const HorizontalSlider({ 
    Key? key, 
    required this.children,
    this.activeDotColor = const Color(0xff4794FF),
    this.inactiveDotColor = const Color(0xffB6D3F5),
    this.activeDotSize = 10,
    this.inactiveDotSize = 8,
    this.viewportfraction = 1.0, 
    this.dotsOnTop = false, 
    this.dotsCrossAxisAlignment = CrossAxisAlignment.start, 
    this.height = double.infinity, 
    this.width = double.infinity
  }) : super(key: key);

  @override
  _HorizontalSliderState createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {

  int _currentIndex = 0;
  late PageController _controller;
  double _pageValue = 0.0;

  void listener(){
    setState(() {
      _pageValue =  _controller.page! ;
    });
  }

  @override
  void initState() {
   _controller = PageController(viewportFraction: widget.viewportfraction);
   _controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: widget.height,
      width: widget.width,
     
      child: Column(
        crossAxisAlignment: widget.dotsCrossAxisAlignment,
         children: [

          if(widget.dotsOnTop)
           FittedBox(
             fit: BoxFit.scaleDown,
             child: _DotsIndicator(dots: _dotsList(), dotsOnTop: widget.dotsOnTop)
           ),
          
          Expanded(
            child: PageView.builder(
              
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) => setState((){_currentIndex = value;}),
              scrollDirection: Axis.horizontal,
              itemCount: widget.children.length,
              itemBuilder: (context, index) {

                double percent = (_pageValue - index).abs();

                return Transform.scale(
                  scale: lerpDouble(1, 0.9, percent)!,
                  child: Opacity(
                    opacity: (1- percent).clamp(0.5, 1.0),
                    child: widget.children[index]
                  ),
                );

              },
              
            ),
          ),

          if(!widget.dotsOnTop)
           FittedBox(
             fit: BoxFit.scaleDown,
             child: _DotsIndicator(dots: _dotsList(), dotsOnTop: widget.dotsOnTop)
           ),
        
        ],
      ),
    );
  }

   List<Widget> _dotsList() {
    
    return List.generate(
    widget.children.length, 
    (index) {

      final bool _isCurrent = _currentIndex == index;

      return FittedBox(
        fit: BoxFit.scaleDown,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.activeDotSize / 2),
            color: _isCurrent ?  widget.activeDotColor : widget.inactiveDotColor,
          ),
          height: _isCurrent ? widget.activeDotSize : widget.inactiveDotSize,
          width: _isCurrent ? widget.activeDotSize * 2 : widget.inactiveDotSize,
        ),
      );
    });
  }

}

class _DotsIndicator extends StatelessWidget {
  final bool dotsOnTop;
  final List<Widget> dots;
  
  const _DotsIndicator({ 
    Key? key, 
    required this.dots, 
    required this.dotsOnTop 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return FittedBox(
          fit: BoxFit.contain,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: dotsOnTop ? const EdgeInsets.only(bottom: 10) : const EdgeInsets.only(top: 10) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...dots
              ],
            )
          ),
        );
  }
}