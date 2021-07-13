import 'package:blockchain_app/controller/assets_controller.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoPillsWidget extends StatelessWidget {
  CryptoPillsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      height: 100,
      child: GetX<AssetsController>(builder: (controller) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            itemCount: controller.assets.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 10),
                        child: controller.assets[index].type!.notation == 'BTC'
                            ? Icon(CryptoFontIcons.BTC)
                            : controller.assets[index].type!.notation == 'ETH'
                                ? Icon(CryptoFontIcons.ETH)
                                : controller.assets[index].type!.notation ==
                                        'LTC'
                                    ? Icon(CryptoFontIcons.LTC)
                                    : controller.assets[index].type!.notation ==
                                            'NEO'
                                        ? Icon(CryptoFontIcons.NEOS)
                                        : Icon(CryptoFontIcons.XEM),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Text(
                            controller.assets[index].type!.type!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
