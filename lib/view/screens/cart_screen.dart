import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/cart/cart_product_card.dart';
import 'package:e_commerce/view/widgetes/cart/cart_total.dart';
import 'package:e_commerce/view/widgetes/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          // elevation: 0,
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,

          title: Text("Card Items".tr),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.delete_sweep),
            )
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return const EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index,
                            productModels:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.productsMap.length),
                  ),
                  CartTotal(),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
