import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/personal_information_page.dart';
import 'package:blockchain_app/pages/phone_number_verification_page.dart';
import 'package:blockchain_app/pages/security_page.dart';
import 'package:blockchain_app/widgets/account_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currency_picker/currency_picker.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
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
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70, bottom: 35),
                      child: Text(
                        'Account Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: AccountTabs(
                              title: 'Personal Information',
                              onTapFunc: () =>
                                  Get.to(() => PersonalInformationPage()),
                            ),
                          ),
                          Container(
                            child: AccountTabs(
                              title: 'Phone Number Verification',
                              onTapFunc: () =>
                                  Get.to(() => PhoneVerificationPage()),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, bottom: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Settings',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: () => showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  onSelect: (selectedCurrency) {
                                    userController.currencySymbol.value =
                                        selectedCurrency.code.toString();
                                    userController.currencyName.value =
                                        selectedCurrency.name.toString();
                                  }),
                              child: Card(
                                elevation: 0,
                                color: Colors.grey.shade200,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Currency',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        child: Obx(
                                          () => Text(
                                            "${userController.currencyName.value} (${userController.currencySymbol.value})",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(Icons.arrow_forward,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: AccountTabs(
                              title: 'Security',
                              onTapFunc: () => Get.to(() => SecurityPage()),
                            ),
                          ),
                          Container(
                            child: AccountTabs(
                              title: 'Help & Support',
                              onTapFunc: () => Get.to(() => {}),
                            ),
                          ),
                          Container(
                            child: AccountTabs(
                              title: 'Legaly',
                              onTapFunc: () => Get.to(() => {}),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.account_circle,
                    size: 70,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
