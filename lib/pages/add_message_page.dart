// @dart=2.9
import 'package:blockchain_app/controller/user_controller.dart';
import 'package:blockchain_app/pages/transaction_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class AddMessagePage extends StatelessWidget {
  var parser = EmojiParser();

  List<Emoji> emojis = [
    Emoji('coffee', '☕'),
    Emoji('heart', '❤️'),
    Emoji('smiley', '🙂'),
    Emoji('monkey', '🙊'),
    Emoji('money', '💸'),
    Emoji('gift', '🎁'),
    Emoji('dinner', '🍽️'),
    Emoji('dress', '👚'),
    Emoji('shoe', '👞')
  ];

  final String contact;
  AddMessagePage({Key key, this.contact}) : super(key: key);
  final userController = Get.put(UserController());

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
              'AddMessage',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    child: ListTile(
                        title: Text(
                          contact,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.contact_mail_outlined)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    height: 105,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: PageScrollPhysics(),
                        itemCount: emojis.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            shape: CircleBorder(),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  parser.emojify(
                                    '${emojis[index].code}',
                                  ),
                                  style: TextStyle(fontSize: 32),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50),
                    child: TextField(
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                          fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Leave Message',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        child: Text(
                          'Sent',
                          style: TextStyle(
                            fontFamily: 'Exo2',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                      onPressed: () => Get.to(() => TransactionDetailsPage(
                            transactionType: 'Sent',
                            realAmount: 32432.23,
                            cryptoAmount: 0.00453,
                            date: DateTime.now(),
                            cryptoType: 'BTC',
                          )),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 110),
              child: Text(
                '0.9345 BTC (\$102.33 USD)',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
