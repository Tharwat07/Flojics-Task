import 'package:e_commerce/services/category_services.dart';
import 'package:get/get.dart';

import '../../model/product_models.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategoryLoading = false.obs;

  var categoryList = <ProductModels>[].obs;
  List<String> imageCategory = [
    "https://images.unsplash.com/photo-1519389950473-47ba0277781c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170",
    "https://media.istockphoto.com/photos/jewelry-on-window-display-picture-id185112218?k=20&m=185112218&s=612x612&w=0&h=64dXuYFlroz_TLipwjJqcd3eza53xglqK3yCEybEqs4=",
    "https://media.istockphoto.com/photos/mens-clothing-and-personal-accessories-picture-id864505242?k=20&m=864505242&s=612x612&w=0&h=bg5e9lCFMleD0LVGMJcpbO0BXSILhjoW_sVxp83YmXM=",
    "https://media.istockphoto.com/photos/polka-dot-summer-brown-dress-suede-wedge-sandals-eco-straw-tote-bag-picture-id1208148708?k=20&m=1208148708&s=612x612&w=0&h=rjZiAPCOpwREiTET21lTP3wM30BUqAG9PjocC-euJ98=",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

   getAllCategorys(String nameCategory) async {
    isAllCategoryLoading(true);
     categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);
      isAllCategoryLoading(false);
    }

  getCategoryIndex(int index) async {
   var categoryName = await getAllCategorys(categoryNameList[index]);
   if (categoryName!=null) {
     categoryList.value = categoryName;
   }

  }
}
