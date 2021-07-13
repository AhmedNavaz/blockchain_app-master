import 'package:blockchain_app/views/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'views/login_screen.dart';


class MainRoot extends StatelessWidget {
  const MainRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.put(AuthController()).currentUser.value?.uid != null ? RootScreen() : LoginScreen());
  }
}
