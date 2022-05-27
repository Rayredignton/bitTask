import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/app_colors.dart';

class BitmamaTextField extends StatelessWidget {
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final Widget leading;
  final Function()? function;
  final String? hint;
  final VoidCallback? onTap;
  final bool suffix;
  final Widget? suffixIcon;

  const BitmamaTextField({
    Key? key,
    required this.controller,
    this.hint,
    this.validator,
    this.function,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.leading = const SizedBox(
      width: 0,
      height: 0,
    ),
    this.onTap,
    this.suffix = true,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:55,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: TextFormField(
        onEditingComplete: function,
        
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
          color: textColor2,
          fontFamily: 'Poppings',
          fontWeight: FontWeight.w400,
        ),
        validator: validator,
        keyboardType: keyboardType,
        textAlign: TextAlign.start,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 16),
          suffixIcon: suffixIcon ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
