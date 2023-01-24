import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/cart_controller.dart';
import '../../utils/theme.dart';
import '../widgetes/payment/delivry_widget.dart';
import '../widgetes/payment/payment_method_widget.dart';

class PayMentScreen extends StatelessWidget {
   PayMentScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,

        title: Text("PayMent".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtil(
                  text: "Shopping to".tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none),
              const SizedBox(
                height: 20,
              ),
              const DeliveryContainerWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtil(
                  text: "Payment Methods".tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: TextUtil(
                  text: "Total".tr + ": \$${controller.productTotal}",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underline: TextDecoration.none,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.payProducts();

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    child: TextUtil(
                      text: "Pay Now".tr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
