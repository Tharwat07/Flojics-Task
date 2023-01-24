import 'package:e_commerce/logic/controller/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/auth/auth_button.dart';
import 'package:e_commerce/view/widgetes/auth/auth_text_form_field.dart';
import 'package:e_commerce/view/widgetes/auth/check_widget.dart';
import 'package:e_commerce/view/widgetes/auth/container_under.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr:Colors.white  ,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.2,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: 'SING'.tr,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? pinkClr :mainColor,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 10,
                            ),
                            TextUtils(
                                text: 'UP'.tr,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underline: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormFeild(
                          controller: nameControler,
                          obscureText: false,
                          validator: (value) {
                            if (value
                                .toString()
                                .length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name'.tr;
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: Get.isDarkMode ? pinkClr :mainColor ,
                            size: 30,
                          ),
                          suffixIcon: const Text(''),
                          hintText: 'User Name'.tr,
                        ),
                        const SizedBox(
                          height: 20,
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
                            color: Get.isDarkMode ? pinkClr :mainColor ,
                            size: 30,
                          ),
                          suffixIcon: const Text(''),
                          hintText: 'Email'.tr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormFeild(
                            controller: passwordControler,
                            obscureText: controller.isVisibilty ? true : false,
                            validator: (value) {
                              if (value
                                  .toString()
                                  .length < 6) {
                                return 'Password is too short .. Password should be longer or equal 6 characters'.tr;
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Get.isDarkMode ? pinkClr :mainColor ,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibilty
                                    ? const Icon(
                                  Icons.visibility,
                                  color: Colors.black,
                                )
                                    : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                            hintText: 'Password'.tr,
                          );
                        }),
                        const SizedBox(
                          height: 50,
                        ),
                        CheckWidget(
                          text1: 'I Accepted  '.tr,
                          text2: 'All terms & conditions'.tr,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {

                          return AuthButton(text: 'Sign Up'.tr, onPressed: () {
                           String name = nameControler.text.trim();
                           String email = emailControler.text.trim();
                           String pass = passwordControler.text.trim();

                           if(controller.isCheckBox == false){
                             Get.snackbar(
                               'Checkbox '.tr,
                               'Please, Accept terms & conditions !'.tr,
                               snackPosition: SnackPosition.BOTTOM,
                               backgroundColor:Get.isDarkMode ? pinkClr :mainColor,
                               colorText: Colors.white,
                             );
                           }
                              controller.signUpWithAPI(
                                  name: name,
                                  email: email,
                                  password: pass
                              );
                              controller.isCheckBox = true;
                          });
                        })
                      ],
                    ),
                  ),
                ),
              ),

              ContainerUnder(
                text1: 'Already have an Account ?'.tr,
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                text2: 'LOGIN'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
