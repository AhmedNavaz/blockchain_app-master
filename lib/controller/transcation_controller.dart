import 'package:blockchain_app/models/crypto.dart';
import 'package:blockchain_app/models/transaction.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var transactions = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    transactionsHistory();
  }

  void transactionsHistory() {
    final getTransactions = [
      Transaction(
          id: 1,
          realAmount: 254.22,
          cryptoAmount: 0000.21,
          date: DateTime.now(),
          transactionType: 'Sent',
          cryptoType: Crypto(notation: 'BTC')),
      Transaction(
          id: 2,
          realAmount: 453.21,
          cryptoAmount: 0000.23,
          date: DateTime.now(),
          transactionType: 'WithDrawn',
          cryptoType: Crypto(notation: 'BTC')),
      Transaction(
          id: 3,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Deposited',
          cryptoType: Crypto(notation: 'NEO')),
      Transaction(
          id: 4,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Deposited',
          cryptoType: Crypto(notation: 'BTC')),
      Transaction(
          id: 5,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Deposited',
          cryptoType: Crypto(notation: 'ETH')),
      Transaction(
          id: 6,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Sent',
          cryptoType: Crypto(notation: 'XLM')),
      Transaction(
          id: 7,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'WithDrawn',
          cryptoType: Crypto(notation: 'NEO')),
      Transaction(
          id: 8,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Deposited',
          cryptoType: Crypto(notation: 'LTC')),
      Transaction(
          id: 9,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'Sent',
          cryptoType: Crypto(notation: 'BTC')),
      Transaction(
          id: 10,
          realAmount: 123.30,
          cryptoAmount: 23.12,
          date: DateTime.now(),
          transactionType: 'WithDrawn',
          cryptoType: Crypto(notation: 'ETH'))
    ];
    transactions.value = getTransactions;
  }
}
