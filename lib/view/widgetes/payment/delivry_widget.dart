import 'package:e_commerce/logic/controller/payment_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildRadioContainer(
          color: changeColor ? Colors.grey.shade400 : Colors.white,
          title: 'In Our Shop'.tr,
          address: 'Egypt, Alexandria,El nasria'.tr,
          phone: '01288401432',
          value: 1,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
          name: 'Mang/ Mohamed Tharwat'.tr,
          icon: Container(),
        ),
        const SizedBox(
          height: 7,
        ),
        Obx(() {
          return buildRadioContainer(
            color: changeColor ? Colors.white : Colors.grey.shade400,
            title: 'Delivery'.tr,
            address: controller.address.value.tr,
            phone: controller.phoneNumber.value.tr,
            value: 2,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
                // print (controller.updatePosit);

              });
              controller.updatePosition();
            },
            name: authController.displayUserName.value,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter your phone number".tr,
                  titleStyle: TextStyle(
                    color:
                        Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  backgroundColor: Colors.white,
                  radius: 0,
                  textCancel: 'Cancel'.tr,
                  cancelTextColor: Colors.black,
                  confirmTextColor: Colors.black45,
                  onCancel: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  textConfirm: 'Save'.tr,
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  onConfirm: () {
                    controller.phoneNumber.value = phoneController.text;
                    Get.back();
                  },
                  content: SizedBox(
                    height: 45,
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextField(
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.black : Colors.white),
                        controller: phoneController,
                        cursorColor:
                            Get.isDarkMode ? Colors.black : Colors.white,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.1)
                              : mainColor.withOpacity(0.2),
                          filled: true,
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Get.isDarkMode
                                  ? Colors.black45
                                  : Colors.white,
                            ),
                          ),
                          hintText: 'Enter your phone number'.tr,
                          hintStyle: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.black45 : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Get.isDarkMode
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone,
                color: Get.isDarkMode ? pinkClr : mainColor,
                size: 25,
              ),
            ),
          );
        })
      ],
    );
  }

  Widget buildRadioContainer({
    required int value,
    required Color color,
    required Function onChanged,
    required String name,
    required String title,
    required String address,
    required String phone,
    required Widget icon,
  }) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
            onChanged: ((int? value) {
              onChanged(value);
            }),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtil(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                  text: name,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextUtil(
                      text: "🇪🇬+02 ",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      underline: TextDecoration.none,
                    ),
                    TextUtil(
                      text: phone,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(
                      width:25 ,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  underline: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
