import 'package:blockchain_app/pages/transaction_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmWithdrawPage extends StatelessWidget {
  final String? amount;
  const ConfirmWithdrawPage({Key? key, this.amount}) : super(key: key);

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
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Destination',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 60),
                    child: Text(
                      '233r8kasdlfn@39rhasdfasdlsjdf',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Divider(
                    indent: 40,
                    endIndent: 40,
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: Text(
                          '3424.23 BTC',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Amount(\$)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: Text(
                          '\$1213443.23',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          'WithDraw fee',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: Text(
                          '00002.23 BTC',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Text(
                          'Confirm',
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
                      onPressed: () {
                        Get.to(() => TransactionDetailsPage(
                              transactionType: 'WithDrawn',
                              realAmount: 32432.23,
                              cryptoAmount: 0.00453,
                              date: DateTime.now(),
                              cryptoType: 'BTC',
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Confirm your tarnsaction',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
