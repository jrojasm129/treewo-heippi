import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomTitledImage extends StatelessWidget {
  
  final String title;
  final Color titleColor;
  final ImageProvider<Object>? placeHolder;
  final ImageProvider<Object> image;
  final Widget Function(
       BuildContext context,
       Object error,
       StackTrace? stackTrace,
  )? imageErrorBuilder; 
  final BoxFit fit;


  const BottomTitledImage({ 
    Key? key, 
    required this.title, 
    required this.image, 
    this.titleColor = const Color(0xff353f59),
    this.placeHolder, 
    this.imageErrorBuilder, 
    this.fit = BoxFit.none, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Expanded(
          child: ClipPath(
            clipper: _ImageClipper(),
            child: placeHolder != null
              ? FadeInImage(
              width: double.infinity,
              height: double.infinity,
              fit: fit,
              placeholder: placeHolder!, 
              image: image,
              imageErrorBuilder: imageErrorBuilder
            ):
            Image(
              image: image,
              fit: fit,
              width: double.infinity,
              height: double.infinity,
            )
          ),
        ),

        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 15, right: size.width * 0.15, bottom: 15 ),
          child: Text(
            title, 
            style: GoogleFonts.playfairDisplay(
              color: titleColor,
              fontSize: (min(size.width * 0.088, size.height*0.04064)).clamp(4, 30),
              fontWeight: FontWeight.bold,
              height: 1 
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,          
          ),
        ),
      ],
    );  
  }
}

class _ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0.0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.3, size.height - 15, size.width, size.height - 15);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}