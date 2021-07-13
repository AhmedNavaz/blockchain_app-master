import 'package:blockchain_app/models/crypto.dart';

class Assets {
  final int? id;
  final Crypto? type;
  final double? amount;

  Assets({
    this.id,
    this.type,
    this.amount,
  });
}
