import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

final List<String> sizeList = [
  'S',
  'M',
  'L',
  'XL',
  'XXl',
  '3Xl',
];
var currentSelected = 0;

class _SizeListState extends State<SizeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              decoration: BoxDecoration(
                color: currentSelected == index
                    ? (Get.isDarkMode
                        ? pinkClr.withOpacity(0.7)
                        : mainColor.withOpacity(0.7))
                    : (Get.isDarkMode ? Colors.black : Colors.white),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Text(
                sizeList[index],
                style: TextStyle(
                    fontSize: 15,
                  color:  Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 5,
          );
        },
        itemCount: sizeList.length,
      ),
    );
  }
}
