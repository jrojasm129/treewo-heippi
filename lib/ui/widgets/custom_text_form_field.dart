import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool showVisibilityIcon;
  final bool filled;
  final Color? filledColor;

  const CustomTextFormField({ 
    Key? key,
    required this.hintText,
    this.controller, 
    this.icon,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.showVisibilityIcon = false, 
    this.validator,
    this.onChanged, 
    this.filled = false, 
    this.filledColor
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: widget.showVisibilityIcon ? obscureText : false,
      style: const TextStyle(fontSize: 19),
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: _buildInputDecoration(),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: widget.filled,
      fillColor: widget.filledColor,
        prefixIcon: widget.icon != null 
          ? Icon(widget.icon)
          : null,
        suffixIcon: widget.showVisibilityIcon
            ? IconButton(
                splashRadius: 5,
                onPressed: () => setState(() {
                      obscureText = !obscureText;
                }),
                icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility
                )
            )
            : null,        
        hintText: widget.hintText       

    );
  }
}