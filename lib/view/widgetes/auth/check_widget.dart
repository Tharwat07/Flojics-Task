import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key,  required this.text1, required this.text2}) : super(key: key);

  final controller = Get.find<AuthController>();
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Icon(
                      Icons.check,
                      size: 20,
                      color: Get.isDarkMode ? pinkClr :mainColor ,
                    )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                TextUtil(
                    text: text1,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none),
                TextUtil(
                    text: text2,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.underline)
              ],
            ),
          ),
        ],
      );
    });
  }
}
