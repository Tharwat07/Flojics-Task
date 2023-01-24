import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/auth/auth_button.dart';
import 'package:e_commerce/view/widgetes/auth/auth_text_form_field.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Get.isDarkMode ?pinkClr  : mainColor,
          centerTitle: true,
          title: TextUtils(
              text: 'Forgot Password'.tr,
              fontSize: 25,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              underline: TextDecoration.none),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        backgroundColor: Get.isDarkMode ? darkGreyClr  :Colors.white ,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID below ...'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.arimaMadurai(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 360,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AuthTextFormFeild(
                    controller: emailControler,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid Email'.tr;
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Get.isDarkMode ? pinkClr :  mainColor,
                      size: 30,
                    ),
                    suffixIcon: const Text(''),
                    hintText: 'Email'.tr,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(text: 'SEND'.tr, onPressed: () {
                      if(formKey.currentState!.validate()){
                        controller.resetPassword(emailControler.text.trim());
                      }

                    });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
