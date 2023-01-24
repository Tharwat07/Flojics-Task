import 'package:e_commerce/language/localiztion.dart';
import 'package:e_commerce/logic/controller/theme_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>("lang").toString()),
        fallbackLocale:Locale(ene),
        translations: LocaliztionApp(),
        title: 'E Commerce'.tr,
        theme: ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().themeDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<String>('token') != null
            ? AppRoutes.mainScreen
            : AppRoutes.splash,
        getPages: AppRoutes.routes);
  }
}
