import 'package:blockchain_app/models/assets.dart';
import 'package:blockchain_app/pages/contacts_viewer_page.dart';
import 'package:blockchain_app/widgets/crypto_pills_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendPage extends StatelessWidget {
  final Assets? type;
  SendPage({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Send to Your Friend  ',
            style: TextStyle(color: Colors.black),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: CryptoPillsWidget()),
              Container(
                child: Text(
                  '${type!.amount.toString()} ${type!.type!.notation!} Available',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 90),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '0.00',
                      hintStyle: TextStyle(fontWeight: FontWeight.w400)),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue.shade700),
                ),
              ),
              Container(
                child: Text(
                  '\$ ${(type!.type!.rate! * type!.amount!).toString()}',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.30),
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 35),
                    child: Text(
                      'Choose Recipient',
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
                    Get.to(() => ContactsViewerPage());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
