import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/home/card_items.dart';
import 'package:e_commerce/view/widgetes/home/search_text_form.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? pinkClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtil(
                        text: 'Find your'.tr,
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        underline: TextDecoration.none),
                    const SizedBox(
                      height: 10,
                    ),
                    TextUtil(
                        text: 'INSPIRATION'.tr,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        underline: TextDecoration.none),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtil(
                    text: 'All Products'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underline: TextDecoration.none),
              ),
            ),
            const SizedBox(height: 30,),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
