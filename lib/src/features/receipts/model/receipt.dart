import 'package:demo_hero_flutter/src/features/receipts/model/merchant.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt.freezed.dart';
part 'receipt.g.dart';

@freezed
class Receipt with _$Receipt {
  const factory Receipt({
    required String receiptNumber,
    required Merchant merchant,
    required DateTime receiptTimeStamp,
    required List<Product> products,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
}
