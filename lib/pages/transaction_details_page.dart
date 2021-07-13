import 'package:blockchain_app/pages/portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blockchain_app/controller/transcation_controller.dart';
import 'package:intl/intl.dart';

class TransactionDetailsPage extends StatelessWidget {
  final DateTime? date;
  final double? realAmount;
  final double? cryptoAmount;
  final String? transactionType;
  final String? cryptoType;
  TransactionDetailsPage(
      {Key? key,
      this.date,
      this.realAmount,
      this.cryptoAmount,
      this.transactionType,
      this.cryptoType})
      : super(key: key);
  final transactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            title: Text(
              'Transaction Details',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: 35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      '${this.transactionType}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: transactionType == 'Exchange'
                              ? Colors.blue
                              : transactionType == 'Sent'
                                  ? Colors.blue.shade700
                                  : transactionType == 'WithDrawn'
                                      ? Colors.red
                                      : Colors.green),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Date',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${DateFormat.yMMMMd('en_US').format(this.date!)}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'Time',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${DateFormat.jm('en_US').format(this.date!)}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.grey.shade200,
                    endIndent: 30,
                    indent: 30,
                    thickness: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text('${this.cryptoAmount} ${this.cryptoType}',
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Total Amount(\$)',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text(
                            '\$${this.realAmount}',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'WithDraw fee',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text(
                            '0.0024 ?',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Status',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextButton.icon(
                            label: Icon(Icons.open_in_new_outlined),
                            icon: Text(
                              'Transaction Confirmed',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    endIndent: 30,
                    indent: 30,
                    thickness: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Transaction ID',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text(
                            '343sldkjfsM3eK4rlkM',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'From',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text(
                            '45MDSI834934r9xcvsdfsdf93',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, bottom: 15),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'To',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 3),
                          child: Text(
                            "3454MDIGNLS3423rxoidfDGh2",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: Text(
                          'Back to Wallet',
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
                        Get.to(() => PortfolioPage());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: transactionType == 'Exchange'
                    ? Colors.blue
                    : transactionType == 'Sent'
                        ? Colors.blue.shade700
                        : transactionType == 'WithDrawn'
                            ? Colors.red
                            : Colors.green,
                child: RotatedBox(
                  quarterTurns: transactionType == 'Sent'
                      ? 0
                      : transactionType == 'WithDrawn'
                          ? 3
                          : 1,
                  child: transactionType == 'Exchange'
                      ? Icon(
                          Icons.swap_vertical_circle_outlined,
                          color: Colors.white,
                          size: 40,
                        )
                      : Icon(
                          Icons.outbond_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
