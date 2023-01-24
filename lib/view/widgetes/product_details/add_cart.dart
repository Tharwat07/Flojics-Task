import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controller/cart_controller.dart';

class AddCart extends StatelessWidget {
   AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);
  final double price;
  final ProductModels productModels;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              TextUtil(
                  text: "Price".tr,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underline: TextDecoration.none),
              Text(
                "\$$price",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.5,
                ),
              )
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
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextUtil(
                            text: "Add to Cart".tr,
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
  }
}
