import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';

/// Interface for Receipt repositories
abstract class ReceiptRepository {
  /// Get all receipts from repository
  Future<List<Receipt>> getReceipts();

  /// Get receipt by id
  Future<Receipt> getReceipt({required String id});
}
