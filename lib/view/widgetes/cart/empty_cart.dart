import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.shopping_cart,
            size: 200, color: Get.isDarkMode ? Colors.white : Colors.black),
        const SizedBox(
          height: 40,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Your Cart is ".tr,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            TextSpan(
              text: "Empty !".tr,
              style: GoogleFonts.sedgwickAve(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? pinkClr : mainColor),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        TextUtil(
            text: "Add items to get Started".tr,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            underline: TextDecoration.none),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 45,
          width: 250,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: Get.isDarkMode ? pinkClr : mainColor,
               // shadowColor: Colors.green,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: Text(
                'Go to home'.tr,
                style: const TextStyle(
                    fontSize: 20,
                   // fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        )
      ]),
    );
  }
}
