import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/view/widgetes/product_details/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgetes/product_details/add_cart.dart';
import '../widgetes/product_details/clothes_info.dart';
import '../widgetes/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);
  final ProductModels productModels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imagUrl: productModels.image,
              ),
              ClothesInfo(
                description: productModels.description.toString(),
                title: productModels.title.toString(),
                productId: productModels.id,
                rate: productModels.rating.rate,
              ),
               const SizeList(),
               AddCart(
                 productModels: productModels ,
                 price: productModels.price,
               ),
            ],
          ),
        ),
      ),
    );
  }
}
