import 'package:flutter/material.dart';

class AuthTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;

  final Function validator;
  final Widget prefixIcon;

  final Widget suffixIcon;
  final String hintText;

  const AuthTextFormFeild(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      style: const TextStyle(
        color: Colors.black
      ),
      decoration: InputDecoration(
        isDense: true,
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );
  }
}
