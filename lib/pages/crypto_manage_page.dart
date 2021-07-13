import 'package:blockchain_app/controller/transcation_controller.dart';
import 'package:blockchain_app/models/assets.dart';
import 'package:blockchain_app/pages/account_page.dart';
import 'package:blockchain_app/pages/exchange_page.dart';
import 'package:blockchain_app/pages/send_page.dart';
import 'package:blockchain_app/pages/withdraw_page.dart';
import 'package:blockchain_app/views/login_screen.dart';
import 'package:blockchain_app/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:blockchain_app/controller/assets_controller.dart';
import 'package:get/get.dart';

class CryptoManagePage extends StatelessWidget {
  final Assets? type;
  CryptoManagePage({Key? key, this.type}) : super(key: key);
  final transactionController = Get.put(TransactionController());
  final assetsController = Get.put(AssetsController());

  void exchange(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            child: Container(
              height: MediaQuery.of(ctx).size.height * 0.80,
              child: ExchangePage(
                type: type,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: Text(
                  'SimpySwap',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(height: MediaQuery.of(context).size.height * 0.07),
              ListTile(
                  leading: Icon(Icons.account_box_rounded),
                  title: Text(
                    'Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Get.to(() => AccountPage());
                  }),
              ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Get.to(() => LoginScreen());
                  })
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            type!.type!.type!,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.format_align_right_outlined),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          leading: BackButton(
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              color: Colors.blue.shade700,
              child: Center(
                child: Text('Graph Here!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Column(
                      children: [
                        Card(
                          color: Colors.grey.shade200,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Deposit',
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => WithDrawPage(
                            type: type,
                          ));
                    },
                    child: Column(
                      children: [
                        Card(
                          color: Colors.grey.shade200,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: RotatedBox(
                                quarterTurns: 3,
                                child: Icon(
                                  Icons.outbound_outlined,
                                  size: 30,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Withdraw',
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SendPage(type: type));
                    },
                    child: Column(
                      children: [
                        Card(
                          color: Colors.grey.shade200,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.outbond_outlined,
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Send',
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => exchange(context),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.grey.shade200,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.swap_horizontal_circle_outlined,
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Exhange',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20, bottom: 10, left: 30),
              child: Text(
                "Latest Transactions",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: !transactionController.transactions.isEmpty
                      ? TransactionList()
                      : Center(
                          child: Text(
                          'No Transactions made yet!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))),
            )
          ],
        ),
      ),
    );
  }
}
