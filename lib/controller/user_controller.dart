import 'package:blockchain_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var country_code = '+1'.obs;
  var currencySymbol = 'USD'.obs;
  var currencyName = 'Dollar'.obs;

  var loggedInUser = UserModel().obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController citizenshipController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  // Future<bool> validateCurrentPassword(String password) async {
  //   return await authController.validatePassword(password);
  // }

  // void updateUserPassword(String password) {
  //   authController.updatePassword(password);
  // }

}
