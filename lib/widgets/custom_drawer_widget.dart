import 'package:blockchain_app/controller/auth_controller.dart';
import 'package:blockchain_app/pages/account_page.dart';
import 'package:blockchain_app/pages/balance_page.dart';
import 'package:blockchain_app/pages/referal_page.dart';
import 'package:blockchain_app/views/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            alignment: Alignment.center,
            child: Text(
              'SimpySwap',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: MediaQuery.of(context).size.height * 0.07),
          ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text(
                'Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(() => AccountPage());
              }),
          ListTile(
              leading: Icon(Icons.account_balance_wallet_rounded),
              title: Text(
                'Balance',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(() => BalancePage());
              }),
          ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Referal Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Get.back();
                Get.to(() => ReferPage());
              }),
          ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                authController.logOut();
              }),
        ],
      ),
    );
  }
}
