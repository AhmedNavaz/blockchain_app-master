import 'package:blockchain_app/models/assets.dart';
import 'package:blockchain_app/models/crypto.dart';
import 'package:get/get.dart';

class AssetsController extends GetxController {
  var assets = <Assets>[].obs;
  var limit = 3.obs;

  @override
  void onInit() {
    super.onInit();
    assetsList();
  }

  void assetsList() {
    final getAssetsList = [
      Assets(
        id: 1,
        type: Crypto(
            id: 1,
            type: 'Bitcoin',
            notation: 'BTC',
            rate: 234234.234,
            trend: 1.45),
        amount: 8452.78,
      ),
      Assets(
        id: 2,
        type: Crypto(
            id: 2,
            type: 'Etherium',
            notation: 'ETH',
            rate: 234123413.23,
            trend: 5.23),
        amount: 1832.23,
      ),
      Assets(
        id: 3,
        type: Crypto(
            id: 3,
            type: 'Litecoin',
            notation: 'LTC',
            rate: 234324.323,
            trend: 0.23),
        amount: 1234.90,
      ),
      Assets(
        id: 4,
        type: Crypto(
            id: 1, type: 'Neo', notation: 'NEO', rate: 0.000490, trend: 1.45),
        amount: 932.90,
      ),
      Assets(
        id: 5,
        type: Crypto(
            id: 5,
            type: 'Steller',
            notation: 'XLM',
            rate: 123334.323,
            trend: -2.21),
        amount: 700.90,
      ),
    ];
    assets.value = getAssetsList;
  }
}
