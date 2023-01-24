import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text1;
  final String text2;
  final Function () onPressed;

  const ContainerUnder({required this.text1, required this.onPressed, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 89,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? pinkClr :mainColor ,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child:Column(
        children:[
          Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtil(
                  text: text1,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  underline: TextDecoration.none),
              TextButton(onPressed: onPressed,
                child: TextUtils(
                  text: text2,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  underline: TextDecoration.underline), ),
            ],
          ),
        ),
     ], ),
    );
  }
}
