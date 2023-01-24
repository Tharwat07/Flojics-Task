import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/logic/controller/category_controller.dart';
import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      ),
      body: Obx((){
       if (categoryController.isAllCategoryLoading.value){
         return Center(
           child: CircularProgressIndicator(
             color: Get.isDarkMode ? pinkClr : mainColor,
           ),
         );
       }
       else {
         return GridView.builder(
             itemCount: categoryController.categoryList.length,
             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               childAspectRatio: 0.8,
               mainAxisSpacing: 9.0,
               crossAxisSpacing: 6.0,
               maxCrossAxisExtent: 200,
             ),
             itemBuilder: (context, index) {
               return bulidCardItems(
                   productModels: categoryController.categoryList[index],
                   id: categoryController.categoryList[index].id,
                   image: categoryController.categoryList[index].image,
                   price: categoryController.categoryList[index].price,
                   rate: categoryController.categoryList[index].rating.rate,
                   onTap: () {
                     Get.to(() => ProductDetailsScreen(
                       productModels:categoryController.categoryList[index],
                     ));
                   });
             });
       }

      })
    );
  }

  Widget bulidCardItems({
    required String image,
    required double price,
    required double rate,
    required int id,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode ? darkGreyClr : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.mangeFav(id);
                      },
                      icon: controller.isFav(id)
                          ? Icon(
                              Icons.favorite_rounded,
                              // color: Colors.black,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            )
                          : Icon(
                              Icons.favorite_border_sharp,
                              // color: Colors.black,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.add,
                        // color: Colors.black,

                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(image, fit: BoxFit.fitHeight),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$rate',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
