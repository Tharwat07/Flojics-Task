import 'package:e_commerce/model/product_models.dart';
import 'package:http/http.dart'as http;
import 'package:e_commerce/utils/my_string.dart';
class ProductServices{

static Future <List<ProductModels>> getProduct()async{
 var respose = await http.get(Uri.parse('$baseUrl/products'));
  if (respose.statusCode == 200){
   var jsonData = respose.body;
   return productModelsFromJson(jsonData);
  }
  else {
    return throw Exception('Failed to load product');
  }
}







}