import 'dart:convert';

import 'package:e_commerce/logic/controller/product_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/facebook_model.dart';
import '../../routes/routes.dart';
import 'cart_controller.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  //var displayUserPhoto = "https://img.icons8.com/office/344/person-male.png".obs;
  FaceBookModel? faceBookModel;
  final controller = Get.put(ProductController());
  final controller1 = Get.put(CartController());
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var isSignedIn = false;
  var token = "";
  final GetStorage authBox = GetStorage();
  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    // displayUserName.value =
    //     (userProfile != null ? userProfile!.displayName : "")!;
    // displayUserName.value =
    //     (userProfile != null ? userProfile!.displayName : "")!;
    // // displayUserPhoto.value =
    // // (userProfile != null ?"https://img.icons8.com/office/344/person-male.png" : userProfile!.photoURL!);
    // displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
    super.onInit();
  }

  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }
  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpWithAPI({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      dynamic response = await post(Uri.parse('$baseUrl/users'), body: {
        'email': email,
        'username': name,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        update();
        Get.offNamed(Routes.loginScreen);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // void signUpUsingFirebase({
  //   required String name,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) {
  //       displayUserName.value = name;
  //       auth.currentUser!.updateDisplayName(name);
  //     });
  //
  //     update();
  //
  //     Get.offNamed(Routes.loginScreen);
  //   } on FirebaseAuthException catch (error) {
  //     String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
  //     String message = '';
  //
  //     if (error.code == 'weak-password'.tr) {
  //       message = 'Provided Password is too weak.. '.tr;
  //     } else if (error.code == 'Email Already In Use'.toString().tr) {
  //       message = 'Account Already exists for this email .. '.tr;
  //     } else if (error.code == 'Email Already In Use'.toString().tr) {
  //       message = 'The email address is already in use by another account.'.tr;
  //     } else {
  //       message = error.message.toString();
  //     }
  //
  //     Get.snackbar(
  //       title.toString().tr,
  //       message.tr,
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       colorText: Colors.black,
  //     );
  //   } catch (error) {
  //     Get.snackbar(
  //       'Error!'.tr,
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       colorText: Colors.black,
  //     );
  //   }
  // }
  //
  Future<dynamic> loginWithAPI(
      {required String name, required String password}) async {
    try {
      dynamic response = await post(Uri.parse('$baseUrl/auth/login'),
          body: {'username': name, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('Login successfully');
        isSignedIn = true;
        token = data['token'];
        authBox.write("auth", isSignedIn);
        authBox.write("token", token);
        print(token);
        authBox.write("name", name);
        update();
        Get.offAllNamed(Routes.mainScreen);
        Get.snackbar(
          "Success",
          "Login Successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.black,
        );
      } else {
        Get.snackbar(
          "ERROR",
          "Login Failed",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.grey,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: Colors.black,
      );
    }
  }

  // void logInUsingFirebase({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) =>
  //             displayUserName.value = auth.currentUser!.displayName!);
  //     displayUserEmail.value = auth.currentUser!.email!;
  //     isSignedIn = true;
  //     authBox.write("auth", isSignedIn);
  //
  //     update();
  //     Get.offAllNamed(Routes.mainScreen);
  //   } on FirebaseAuthException catch (error) {
  //     String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
  //     String message = '';
  //
  //     if (error.code == 'user-not-found'.tr) {
  //       message =
  //           'Account does not exists for that Create your account by signing up..'
  //               .tr;
  //     } else if (error.code == 'Wrong Password'.tr) {
  //       message =
  //           'The password is invalid or the user does not have a password.'.tr;
  //     } else {
  //       message = error.message.toString();
  //     }
  //     Get.snackbar(
  //       title.toString().tr,
  //       message.tr,
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       colorText: Colors.black,
  //     );
  //   } catch (error) {
  //     Get.snackbar(
  //       'Error!'.tr,
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.grey,
  //       colorText: Colors.black,
  //     );
  //   }
  // }

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!'.tr,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: Colors.black,
      );
    }
  }

  void faceBookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      isSignedIn = true;
      displayUserName.value = faceBookModel!.name! == null
          ? displayUserName.value = faceBookModel!.name!
          : displayUserName.value = faceBookModel!.name!;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found'.tr) {
        message =
            'Account does not exists for that Create your account by signing up..'
                .toString()
                .tr;
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title.tr,
        message.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        'Error!'.tr,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: Colors.black,
      );
    }
  }

  void signOutFromApp() async {
    try {
      controller1.signOutProducts();
      controller.clearFav();
      await auth.signOut();
      // await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove("auth");
      authBox.remove("token");
      authBox.remove("name");

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!'.tr,
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey,
        colorText: Colors.black,
      );
    }
  }
}
