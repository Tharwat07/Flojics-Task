
import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
          (){
            if(controller.favouritesList.isEmpty) {
              return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/heart.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextUtil(
                      text: 'Please, Add your favorites products. '.tr,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Get.isDarkMode ? Colors.white : Colors.black,

                      underline: TextDecoration.none),
                ],
              ),
            );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavItems(
                    id: controller.favouritesList[index].id,
                    title: controller.favouritesList[index].title,
                    image: controller.favouritesList[index].image,
                    price: controller.favouritesList[index].price,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.blueGrey,
                    thickness: 2,
                  );
                },
                itemCount: controller.favouritesList.length);
            }
          }
      ),

    );
  }

  Widget buildFavItems({
  required String image,
    required String title,
    required double price,
    required int id,

}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
      //  margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:  Get.isDarkMode ? pinkClr.withOpacity(0.3) : mainColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.mangeFav(id);
              },
              icon: Icon(
                Icons.favorite_rounded,
                size: 35,
                color:Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
