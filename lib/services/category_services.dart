import 'package:e_commerce/model/product_models.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/utils/my_string.dart';
import '../model/category_model.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var respose = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (respose.statusCode == 200) {
      var jsonData = respose.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(String categoryName) async {
    var respose =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (respose.statusCode == 200) {
      var jsonData = respose.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
