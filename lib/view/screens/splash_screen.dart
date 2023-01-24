import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/main_screen.dart';
import 'package:e_commerce/view/screens/welcome_screen.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
            children: [
              SizedBox(height: 150,),

              Lottie.network(
                  "https://assets2.lottiefiles.com/private_files/lf30_ng6ygsm6.json"
              ),
              SizedBox(height: 50,),
              const TextUtils(text: "E Commerce App",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  underline: TextDecoration.none),


            ],
          ),
      ),
      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      nextScreen: WelcomeScreen(),
      splashIconSize: 800,
      duration: 6000,


    );
  }
}
