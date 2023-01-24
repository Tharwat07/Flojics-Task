import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              children: [
                TextUtil(
                    text: "Total".tr,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    underline: TextDecoration.none),
                Text(
                  "\$${controller.productTotal}",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextUtil(
                              text: "CheckOut".tr,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              underline: TextDecoration.none),
                          const Icon(Icons.shopping_cart),
                        ],
                      ))),
            ),
          ],
        ),
      );
    });
  }
}
