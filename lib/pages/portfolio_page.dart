import 'package:blockchain_app/pages/all_assets_page.dart';
import 'package:blockchain_app/pages/crypto_manage_page.dart';
import 'package:blockchain_app/widgets/custom_drawer_widget.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:blockchain_app/controller/assets_controller.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

class PortfolioPage extends StatelessWidget {
  PortfolioPage({Key? key}) : super(key: key);
  final assetsController = Get.put(AssetsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Portfolio',
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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: !assetsController.assets.isEmpty
          ? Column(
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
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(top: 20, left: 30),
                          child: Text(
                            "Assets",
                            style: TextStyle(
                                fontFamily: 'Exo2',
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        myThreeTiles(),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: DottedBorder(
                            color: Colors.grey,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(30),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 15, bottom: 15, left: 81, right: 81),
                              child: Text(
                                '+ Deposit more coins',
                                style: TextStyle(
                                    fontFamily: 'Exo2',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: Text(
                              'See all assets',
                              style: TextStyle(
                                  fontFamily: 'Exo2',
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Get.to(() => AllAssetsPage());
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              margin: const EdgeInsets.only(bottom: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Place for managing all your crypto related day-to-day tasks simple and easy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.5),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: Image.asset(
                      'assets/images/p8.png',
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget myThreeTiles() {
    return GetX<AssetsController>(builder: (controller) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.limit.value,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
              child: Card(
                color: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: InkWell(
                  onTap: () {
                    Get.to(
                        () => CryptoManagePage(type: controller.assets[index]));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: controller.assets[index].type!.notation ==
                                  'BTC'
                              ? Icon(CryptoFontIcons.BTC)
                              : controller.assets[index].type!.notation == 'ETH'
                                  ? Icon(CryptoFontIcons.ETH)
                                  : controller.assets[index].type!.notation ==
                                          'LTC'
                                      ? Icon(CryptoFontIcons.LTC)
                                      : controller.assets[index].type!
                                                  .notation ==
                                              'NEO'
                                          ? Icon(CryptoFontIcons.NEOS)
                                          : Icon(CryptoFontIcons.XEM),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
    });
  }
}
