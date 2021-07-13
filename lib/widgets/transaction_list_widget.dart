import 'package:blockchain_app/controller/transcation_controller.dart';
import 'package:blockchain_app/pages/transaction_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetX<TransactionController>(builder: (controller) {
            return !controller.transactions.isEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 25),
                        child: Card(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => TransactionDetailsPage(
                                  date: controller.transactions[index].date!,
                                  realAmount: controller
                                      .transactions[index].realAmount!,
                                  cryptoAmount: controller
                                      .transactions[index].cryptoAmount!,
                                  transactionType: controller
                                      .transactions[index].transactionType!,
                                  cryptoType: controller.transactions[index]
                                      .cryptoType!.notation));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: controller.transactions[index]
                                                .transactionType ==
                                            'Sent'
                                        ? Icon(
                                            Icons.outbound_outlined,
                                            color: Colors.blue.shade700,
                                          )
                                        : controller.transactions[index]
                                                    .transactionType ==
                                                'WithDrawn'
                                            ? RotatedBox(
                                                quarterTurns: 3,
                                                child: Icon(
                                                  Icons.outbound_outlined,
                                                  color: Colors.red,
                                                ),
                                              )
                                            : RotatedBox(
                                                quarterTurns: 1,
                                                child: Icon(
                                                  Icons.outbound_outlined,
                                                  color: Colors.green,
                                                ),
                                              ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '\$ ${controller.transactions[index].realAmount}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Exo2'),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '${controller.transactions[index].cryptoAmount} ${controller.transactions[index].cryptoType!.notation}',
                                          style: TextStyle(fontFamily: 'Exo2'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          '${controller.transactions[index].transactionType}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Exo2'),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          DateFormat.yMMMMd('en_US').format(
                                              controller
                                                  .transactions[index].date!),
                                          style: TextStyle(fontFamily: 'Exo2'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Make your first deposit for your transactions to become visible here.",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: Image.asset(
                            'assets/images/p7.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Text(
                                'Deposit Coins',
                                style: TextStyle(
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        )
      ],
    );
  }
}
