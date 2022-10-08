import 'package:demo_hero_flutter/src/features/receipts/model/merchant.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/product.dart';
import 'package:demo_hero_flutter/src/utils/helpers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt.freezed.dart';
part 'receipt.g.dart';

@freezed
class Receipt with _$Receipt {
  factory Receipt({
    required String receiptNumber,
    required Merchant merchant,
    required DateTime receiptTimeStamp,
    required List<Product> products,
    // ignore: invalid_annotation_target
    @JsonKey(
      name: 'totalPriceIncVAT',
      fromJson: totalPriceFromJson,
    )
        required double totalPriceIncVAT,
    required String currencyISOCode,
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);
}
