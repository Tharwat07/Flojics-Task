
import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;
  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();
  get productTotal => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(3);
  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }


  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
    // Get.snackbar(
    //   'Removed',
    //   "${productsMap[productModels].toString()}",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Get.isDarkMode ? pinkClr : mainColor ,
    //   colorText: Colors.white,
    // );
  }

  void clearAllProducts() {
    Get.defaultDialog(
        title: "Delete All Products".tr,
        titleStyle: TextStyle(
          color: Get.isDarkMode ? pinkClr : mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        middleText: 'Are you sure you need clear products ?'.tr,
        middleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        backgroundColor: darkGreyClr,
        radius: 10,
        textCancel: 'No'.tr,
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(Routes.cartScreen);
        },
        textConfirm: 'Yes'.tr,
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
        onConfirm: () {
          productsMap.clear();
          Get.back();
        });
  }

  void signOutProducts() {
          productsMap.clear();
        }

  void payProducts() {
    Get.defaultDialog(
        title: "Buy All Products".tr,
        titleStyle: TextStyle(
          color: Get.isDarkMode ? pinkClr : mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        middleText: 'Are you sure pay'.tr + ' $productTotal ?'.tr,
        middleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        backgroundColor: darkGreyClr,
        radius: 10,
        textCancel: 'Cancel'.tr,
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(Routes.paymentScreen);
        },
        textConfirm: 'Confirm'.tr,
        buttonColor: Get.isDarkMode ? pinkClr : mainColor,
        onConfirm: () {
          productsMap.clear();
          Get.offNamed(Routes.mainScreen);
        });
  }
}
