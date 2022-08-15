import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';

abstract class ReceiptRepository {
  Future<List<Receipt>> getReceipts();
}
