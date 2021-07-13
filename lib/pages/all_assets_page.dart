import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:get/get.dart';
import 'package:blockchain_app/controller/assets_controller.dart';
import 'crypto_manage_page.dart';

class AllAssetsPage extends StatelessWidget {
  AllAssetsPage({Key? key}) : super(key: key);
  final assetsController = Get.find<AssetsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            title: Text(
              'All Assets',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: GetX<AssetsController>(builder: (controller) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.assets.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 25),
                          child: Card(
                            color: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => CryptoManagePage(
                                      type: controller.assets[index],
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: controller.assets[index].type!
                                                  .notation ==
                                              'BTC'
                                          ? Icon(CryptoFontIcons.BTC)
                                          : controller.assets[index].type!
                                                      .notation ==
                                                  'ETH'
                                              ? Icon(CryptoFontIcons.ETH)
                                              : controller.assets[index].type!
                                                          .notation ==
                                                      'LTC'
                                                  ? Icon(CryptoFontIcons.LTC)
                                                  : controller.assets[index]
                                                              .type!.notation ==
                                                          'NEO'
                                                      ? Icon(
                                                          CryptoFontIcons.NEOS)
                                                      : Icon(
                                                          CryptoFontIcons.XEM),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '${controller.assets[index].type!.type}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Exo2'),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${controller.assets[index].amount} ${controller.assets[index].type!.notation}',
                                            style:
                                                TextStyle(fontFamily: 'Exo2'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            '\$ ${controller.assets[index].amount}',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Exo2'),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${controller.assets[index].type!.trend}%',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Exo2'),
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
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
