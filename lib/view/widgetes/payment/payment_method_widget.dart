import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              name: 'PayPal'.tr,
              image: 'assets/images/paypal.png',
              scale: 0.7,
              value: 1,
               onChange:(int?value){
                setState(() {
                  radioPaymentIndex =value!;
                });
               }),
          const SizedBox(height: 7,),
          buildRadioPayment(
              name: 'Google Pay'.tr,
              image: 'assets/images/google-pay.png',
              scale: 0.7,
              value: 2,
              onChange:(int?value){
                setState(() {
                  radioPaymentIndex =value!;
                });
              }),
          const SizedBox(height: 7,),

          buildRadioPayment(
              name: 'Credit Card'.tr,
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange:(int?value){
                setState(() {
                  radioPaymentIndex =value!;
                });
              }),
          const SizedBox(height: 7,),

        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,

  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],

      ),
      height: 50,
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, scale: scale,),
              const SizedBox(width: 20,),
              Center(
                child: TextUtil(
                  text: name,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  underline: TextDecoration.none,),
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith(
                    (states) => Get.isDarkMode ? pinkClr : mainColor),
          ),
        ],
      ),
    );
  }
}
