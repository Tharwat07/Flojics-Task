import 'package:e_commerce/model/product_models.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favouritesList = <ProductModels>[].obs;
  static   final storage = GetStorage();
  var searchList = <ProductModels>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getFavList();
    super.onInit();
    getProducts();
  }

  void getFavList() async {
    await GetStorage.init();
    List? storedShoppings = storage.read<List>('isFavouritesList');
    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void mangeFav(int productId) async {
    var exIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (exIndex >= 0) {
      favouritesList.removeAt(exIndex);
      await storage.write("isFavouritesList", favouritesList);
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFav(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchController.clear();
    addSearchToList("");
  }

  void clearFav() {
    favouritesList.clear();
     storage.remove("isFavouritesList");
  }
}
