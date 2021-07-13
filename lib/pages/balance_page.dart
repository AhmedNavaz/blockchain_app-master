import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/credit_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalancePage extends StatelessWidget {
  BalancePage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Current Balance',
            style: TextStyle(color: Colors.blue.shade700),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 100),
              child: Card(
                elevation: 4,
                shape: CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(80),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          '4554.12',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          userController.currencySymbol.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Payment Methods',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'No payment methods added yet!',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  child: Text(
                    'Add Card',
                    style: TextStyle(
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ))),
                onPressed: () {
                  Get.to(() => CreditCardPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
