import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/imag.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Container(
                      height: 60,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextUtils(
                          underline: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          text: 'Welcome'.tr,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            underline: TextDecoration.none,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            text: 'E Commerce'.tr,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            underline: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            text: 'Shop'.tr,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 300,
                        width: 500,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Get.isDarkMode ? pinkClr : mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 5),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.loginScreen);
                        },
                        child: TextUtil(
                          underline: TextDecoration.none,
                          text: 'Get Started'.tr,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtil(
                            underline: TextDecoration.none,
                            text: 'Don\'t have an account'.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child: TextUtil(
                            underline: TextDecoration.underline,
                            text: 'Sign Up'.tr,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
