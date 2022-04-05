

import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomIconButtom extends StatelessWidget {

  final String label;
  final IconData icon;
  final Color iconColor;
  final Color? backGroundColor;
  final Function()? onPressed;

  const CustomIconButtom({ 
    Key? key,
    required this.label, 
    required this.icon, 
    this.iconColor = kPrimaryColor,
    this.backGroundColor = Colors.transparent,
    this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return TextButton.icon(
      label: Text(
        label,
        style: textTheme.button!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
      ),
      icon: Icon(icon, color: iconColor),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
