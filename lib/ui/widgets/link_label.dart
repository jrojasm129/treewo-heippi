import 'package:flutter/material.dart';

class LinkLabel extends StatelessWidget {

  final VoidCallback ontap;
  final String label;
  final Color labelColor;
  final String linkLabel;
  final Color linkLabelColor;

  const LinkLabel({
    Key? key, 
    required this.ontap, 
    required this.label, 
    required this.linkLabel,
    this.labelColor =Colors.black,
    this.linkLabelColor =Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: GestureDetector(
        onTap: ontap,
        child: RichText(
          text: TextSpan(
            text: '$label  ',
            style: TextStyle(color: labelColor, fontSize: 13),
            children: [
              TextSpan(text: linkLabel,
                style:  TextStyle(color: linkLabelColor, fontSize: 17, fontWeight: FontWeight.bold)
              )
          ])
        )
      )
    );
  }
}