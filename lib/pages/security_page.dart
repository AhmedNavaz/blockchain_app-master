import 'package:blockchain_app/pages/change_password_page.dart';
import 'package:blockchain_app/pages/change_pin.dart';
import 'package:blockchain_app/pages/two_factor_page.dart';
import 'package:blockchain_app/widgets/account_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityPage extends StatelessWidget {
  SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white10,
          centerTitle: true,
          title: Text(
            'Security',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/p3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: AccountTabs(
                    title: 'Change Password',
                    onTapFunc: () => Get.to(() => ChangePassword()),
                  ),
                ),
                Container(
                  child: AccountTabs(
                    title: 'Change Pin',
                    onTapFunc: () => Get.to(() => ChangePin()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    onTap: () => Get.to(() => TwoFactor()),
                    child: Card(
                      elevation: 0,
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Two-Factor Verification',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              child: CupertinoSwitch(
                                  activeColor: Colors.blue.shade700,
                                  onChanged: (value) {},
                                  value: false),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
