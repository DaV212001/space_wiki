import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_wiki/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../screens/main_layout_screen.dart';

class SignUpController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  FocusNode firstnameFocusNode = FocusNode();

  TextEditingController lastnameController = TextEditingController();
  FocusNode lastnameFocusNode = FocusNode();

  TextEditingController emailAddressController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  UserService _userService = UserService();
  RxBool isLoading = false.obs;
  User? user;
  void signUserUp() async {
    isLoading.value = true;
    try {
      user = await _userService.signUp(
          firstName: firstnameController.text,
          lastName: lastnameController.text,
          phone: phoneController.text,
          email: emailAddressController.text,
          password: passwordController.text);
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        title: 'Successfully signed up',
        message: 'You have successfully registered into the app',
      ));
      Get.offAll(() => MainLayoutScreen());
    } catch (e) {
      print(e);
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        title: 'Error Signing Up',
        message: e.toString(),
      ));
    } finally {
      isLoading.value = false;
    }
  }
}
