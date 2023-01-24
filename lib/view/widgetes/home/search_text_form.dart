import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: GetBuilder<ProductController>(
        builder: (_) => TextField(
          controller: controller.searchController,
          cursorColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            controller.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            filled: true,
            focusColor: Colors.red,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: controller.searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.clearSearch();
                    },
                    icon: const Icon(Icons.close))
                : null,
            hintText: 'Search you\'re looking for (name & price)'.tr,
            hintStyle: const TextStyle(
              //color: Get.isDarkMode ? Colors.white :Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? Colors.black54 : Colors.white,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(25),
                topLeft: Radius.circular(0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? Colors.black54 : Colors.white,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(25),
                topLeft: Radius.circular(0),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? Colors.black54 : Colors.white,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(25),
                topLeft: Radius.circular(0),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? Colors.black54 : Colors.white,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(25),
                topLeft: Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
