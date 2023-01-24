import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
   const AuthButton({required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode ? pinkClr :mainColor ,
          minimumSize: const Size(360, 50),
        ),
        onPressed: onPressed,
        child: TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:Colors.white,
            underline: TextDecoration.none));
  }
}
