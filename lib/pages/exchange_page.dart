import 'package:blockchain_app/controller/assets_controller.dart';
import 'package:blockchain_app/models/assets.dart';
import 'package:blockchain_app/pages/confirm_exchange.dart';
import 'package:blockchain_app/widgets/crypto_pills_widget.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangePage extends StatelessWidget {
  final assetsController = Get.put(AssetsController());
  final Assets? type;
  ExchangePage({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Buying',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: CryptoPillsWidget(),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 90),
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
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '\$ ${(type!.type!.rate! * type!.amount!).toString()}',
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Selling',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 80),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: type!.type!.notation == 'BTC'
                                ? Icon(CryptoFontIcons.BTC)
                                : type!.type!.notation == 'ETH'
                                    ? Icon(CryptoFontIcons.ETH)
                                    : type!.type!.notation == 'LTC'
                                        ? Icon(CryptoFontIcons.LTC)
                                        : type!.type!.notation == 'NEO'
                                            ? Icon(CryptoFontIcons.NEOS)
                                            : Icon(
                                                CryptoFontIcons.XEM,
                                              ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 22),
                            child: Text(
                              type!.type!.type!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Container(
                      child: Text(
                        '${type!.amount.toString()} ${type!.type!.notation!} Available',
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 90),
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
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '\$ ${(type!.type!.rate! * type!.amount!).toString()}',
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: Text(
                            'Exchange',
                            style: TextStyle(
                                fontFamily: 'Exo2',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                        onPressed: () {
                          Get.to(() => ConfirmExchangePage());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
