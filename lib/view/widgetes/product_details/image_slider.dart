import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/logic/controller/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widgetes/product_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  const ImageSliders({Key? key, required this.imagUrl}) : super(key: key);
  final String imagUrl;

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

final cartcontroller = Get.find<CartController>();

CarouselController carouselController = CarouselController();
int currentColor = 0;
int currentPage = 0;
final List<Color> colorSelected = [
  kCOlor1,
  kCOlor2,
  kCOlor3,
  kCOlor4,
  kCOlor5,
];

class _ImageSlidersState extends State<ImageSliders> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, reindex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imagUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 150,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Get.isDarkMode ? Colors.white : Colors.black,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 5,
          child: Container(
            height: 220,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentColor = index;
                    },
                    child: ColorPicker(
                        outerBorder: currentColor == index,
                        color: colorSelected[index]),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 3,
                    ),
                itemCount: colorSelected.length),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.5)
                        : mainColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child:  Icon(
                        Icons.arrow_back_rounded,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              Obx(() {
                return Badge(
                  borderRadius: BorderRadius.circular(10),
                  position: BadgePosition.topEnd(top: -8, end: -8),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartcontroller.quantity().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.5)
                            : mainColor.withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
