import 'package:blockchain_app/controller/auth_controller.dart';
import 'package:blockchain_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var country_code = '+1'.obs;
  var currencySymbol = 'USD'.obs;
  var currencyName = 'Dollar'.obs;

  var loggedInUser = UserModel().obs;

}
