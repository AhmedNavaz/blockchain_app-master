import 'package:blockchain_app/pages/confirm_withdraw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawAddressPage extends StatelessWidget {
  final String? name;
  const WithdrawAddressPage({Key? key, this.name}) : super(key: key);

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
              'Withdraw',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                        ),
                        labelText: 'Withdraw address',
                        labelStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text(
                        'Scan QR Code',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 250),
                    child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Text(
                            'Withdraw ${name.toString()}',
                            style: TextStyle(
                                fontFamily: 'Exo2',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                        onPressed: () {
                          Get.to(() => ConfirmWithdrawPage());
                        }),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Paste or scan withdraw address.',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
