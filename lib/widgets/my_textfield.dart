import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText, this.prefixIcon, this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),//const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: soustitre(background),
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.grey,
            focusColor: background,
            suffixIcon: sufixIcon,
            suffixIconColor: Colors.grey,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: background),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: soustitre(Colors.grey),
        )
      ),
    );
  }
}
