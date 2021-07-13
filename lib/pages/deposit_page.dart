import 'package:blockchain_app/pages/document_verify_page.dart';
import 'package:blockchain_app/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SimpySwap',
          style: TextStyle(color: Colors.black),
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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "This is a place where you can find your deposited assets. Let's go through your first deposit!",
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: Image.asset(
                'assets/images/p1.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  child: Text(
                    'Deposit Coins',
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ))),
                onPressed: () {
                  Get.to(() => DocumentVerifyPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
