import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../text.dart';

class LogOteWidget extends StatelessWidget {
   LogOteWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "LogOut From App".tr,
                titleStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                middleText: 'Are you sure you need to logout ?'.tr,
                middleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
                backgroundColor: Colors.blueGrey,
                radius: 10,
                textCancel:'No'.tr,
                cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black ,
                confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                onCancel: (){Get.back();},
                textConfirm: 'Yes'.tr,
                buttonColor:Get.isDarkMode ? pinkClr : mainColor ,
                onConfirm: (){controller.signOutFromApp();}
            );
          },



          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtil(
                text: "Logout".tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ],
          ),
        ),
      );
    });
  }
}
