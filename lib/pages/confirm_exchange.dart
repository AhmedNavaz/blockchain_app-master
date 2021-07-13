import 'package:blockchain_app/pages/transaction_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmExchangePage extends StatelessWidget {
  final String? amount;
  const ConfirmExchangePage({Key? key, this.amount}) : super(key: key);

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
              'Exchange',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Total Recieve Amount',
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
                      '343.234234234 ETH',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      '\$1423223.23',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
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
                          'Receive Amount',
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
                          '343.234234234 ETH',
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
                          'Receive Amount(\$)',
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
                          '\$1423223.23',
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
                          'Given Amount',
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
                          '32422.23 BTC',
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
                          'Exchange Fee',
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
                          '0000.23 BTC',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
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
                              transactionType: 'Exchange',
                              realAmount: 123.23,
                              cryptoAmount: 0.0213,
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
