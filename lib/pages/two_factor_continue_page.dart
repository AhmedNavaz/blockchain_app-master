import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactorContinue extends StatelessWidget {
  const TwoFactorContinue({Key? key}) : super(key: key);

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
              'Two-Factor Verification',
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
                        labelText: 'Confirmation Code',
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
                        'Paste Code',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 300),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                      onPressed: () => Get.to(() => TwoFactorContinue()),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Please enter the confirmation code from your auth app.',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
