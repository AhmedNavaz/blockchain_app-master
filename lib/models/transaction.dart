import 'package:blockchain_app/models/crypto.dart';

class Transaction {
  final int? id;
  final double? realAmount;
  final double? cryptoAmount;
  final DateTime? date;
  final String? transactionType;
  final Crypto? cryptoType;

  Transaction(
      {this.id,
      this.realAmount,
      this.cryptoAmount,
      this.date,
      this.cryptoType,
      this.transactionType});
}
