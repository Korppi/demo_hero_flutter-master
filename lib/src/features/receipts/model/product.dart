import 'package:demo_hero_flutter/src/utils/helpers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String quantity,
    // ignore: invalid_annotation_target
    @JsonKey(
      name: 'totalAmountIncVAT',
      fromJson: totalPriceFromJson,
    )
        required double totalAmountIncVAT,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
