import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgetes/setting/dark_mode_widget.dart';
import '../widgetes/setting/language_widget.dart';
import '../widgetes/setting/logout_widget.dart';
import '../widgetes/setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtil(
              text: "GENERAL".tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
              underline: TextDecoration.none),
          const SizedBox(
            height: 20,
          ),
           DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOteWidget(),
        ],
      ),
    );
  }
}
