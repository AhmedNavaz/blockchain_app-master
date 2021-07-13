import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/widgets/account_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentVerifyPage extends StatelessWidget {
  DocumentVerifyPage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            title: Text(
              'Document Verification',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: Text(
                      'Please enter your country and your phone number to recieve a verification code.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: AccountTabs(
                      title: 'National ID',
                      onTapFunc: () {},
                    ),
                  ),
                  Container(
                    child: AccountTabs(
                      title: 'Passport',
                      onTapFunc: () {},
                    ),
                  ),
                  Container(
                    child: AccountTabs(
                      title: 'Driver\'s License',
                      onTapFunc: () {},
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
