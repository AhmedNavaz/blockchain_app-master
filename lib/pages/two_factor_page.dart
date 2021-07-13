import 'package:blockchain_app/pages/two_factor_continue_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactor extends StatelessWidget {
  const TwoFactor({Key? key}) : super(key: key);

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
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                      child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('assets/images/qr.png'),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text(
                    '3sdklhfUNFDSIF89w389r23NDw8rsdlf',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      'Copy',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Text(
                        'Continue',
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
              'Scan the QR code or enter the code manually in your auth app.',
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
