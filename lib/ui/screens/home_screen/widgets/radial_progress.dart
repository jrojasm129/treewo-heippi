import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  
  final double percentage;
  final Color primaryColor;
  final Color secundaryColor;
  final double prymaryTickness;
  final double secundaryTickness;
  final Widget? child;
  final Color percentageTextColor;
  final double percentageTextSize;

  const RadialProgress({
    Key? key, 
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secundaryColor = const Color(0xffFBFBFB),
    this.prymaryTickness = 15.0,
    this.secundaryTickness = 15.0,
    this.percentageTextColor = Colors.grey,
    this.percentageTextSize = 40.0,
    this.child,
  }) : super(key: key);



  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late  double porcentajeAnterior;
  

  @override
  void initState() {
    porcentajeAnterior = widget.percentage;
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    _controller.forward(from: 0.0);

    final _diferenciaAnimar = widget.percentage - porcentajeAnterior;
    porcentajeAnterior = widget.percentage == 100 ? 0.0 : widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {

        final _porcentaje = lerpDouble(widget.percentage - _diferenciaAnimar, widget.percentage, _controller.value);

        return SizedBox(
          
           height: double.infinity,
           width: double.infinity,
           child: CustomPaint(  
             child: Padding(
               padding: EdgeInsets.all(math.max(widget.prymaryTickness, widget.secundaryTickness)),
               child: Align(
                 alignment: Alignment.center,
                 child: widget.child != null
                 ? widget.child!
                 : const SizedBox.shrink(),
               ),
             ),               
             painter: _ProgressCircularPainter(
               _porcentaje!, 
               widget.primaryColor,
               widget.secundaryColor,
               widget.prymaryTickness,
               widget.secundaryTickness,
             ),
           ),
        );
      },
    );
  }
}

 class _ProgressCircularPainter extends CustomPainter {

   final double _porcentaje;
   final Color _primaryColor;
   final Color _secundaryColor;
   final double _prymaryTickness;
   final double _secundaryTickness;

   _ProgressCircularPainter(
     this._porcentaje,
     this._primaryColor,
     this._secundaryColor,
     this._prymaryTickness,
     this._secundaryTickness
   );

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..style       = PaintingStyle.stroke
    ..color       = _secundaryColor
    ..strokeWidth = _secundaryTickness;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = math.min(size.width /2, size.height /2);

    canvas.drawCircle(center, radius, paint);

    Paint paintArc = Paint()
    ..style       = PaintingStyle.stroke
    ..color       = _primaryColor
    ..strokeCap   = StrokeCap.round
    ..strokeWidth = _prymaryTickness;

    double arcAngle = 2 * math.pi * (_porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -math.pi /2, 
      arcAngle, 
      false, 
      paintArc
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

 }