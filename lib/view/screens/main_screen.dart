import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import '../../logic/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  final cartcontroller = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              leading: Container(
                child: Icon(Icons.eighteen_mp),
              ),
              actions: [
                Obx(() {
                  return Badge(
                    //  shape: BadgeShape.square,
                    borderRadius: BorderRadius.circular(15),
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartcontroller.quantity().toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          ),
                    ),

                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.cartScreen);
                        },
                        icon: Icon(Icons.shopping_basket,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black)),
                  );
                })
              ],
              backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              title: TextUtil(
                  text: controller.titles[controller.currentIndex.value].value.tr,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  underline: TextDecoration.none),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home_work,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(Icons.home_work,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(Icons.category_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.favorite_sharp,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(Icons.favorite_rounded,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ''),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
