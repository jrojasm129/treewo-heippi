import 'package:flutter/material.dart';
import 'package:tree_wo/constants.dart';

class CustomOutlinedButtom extends StatelessWidget {

  final String label;
  final Function()? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final Color labelColor;
  final BorderRadius borderRadius;
  final double fontSize;

  const CustomOutlinedButtom({
    Key? key,
     required this.label,
     this.onPressed,
     this.width = 240,
     this.height = 55,
     this.backgroundColor = kPrimaryColor,
     this.borderColor = Colors.transparent,
     this.labelColor = Colors.white,
     this.borderRadius =  const BorderRadius.all(Radius.circular(10)), 
     this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: onPressed, 
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label, 
          style: TextStyle(color: labelColor, fontSize: fontSize)
        )),
      style: OutlinedButton.styleFrom(  
        minimumSize: Size(width, height),                      
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius
        ),
        side: BorderSide(
          color: borderColor
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        backgroundColor: backgroundColor,
        primary: Colors.white
      ),
    );
   
  }
}