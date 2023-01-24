import 'package:e_commerce/view/screens/category_screen.dart';
import 'package:e_commerce/view/screens/favorites_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:e_commerce/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;
  final titles = [
    'Home'.tr.obs,
    'Categories'.tr.obs,
    'Favorites'.tr.obs,
    'Settings'.tr.obs,
  ].obs;


}
