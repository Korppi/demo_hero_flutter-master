import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipts_summary.freezed.dart';
part 'receipts_summary.g.dart';

@freezed
class ReceiptsSummary with _$ReceiptsSummary {
  const factory ReceiptsSummary({
    @Default(0) int receiptCount,
    @Default(0) double highestCost,
    @Default(0) double lowestCost,
  }) = _ReceiptsSummary;

  factory ReceiptsSummary.fromJson(Map<String, dynamic> json) =>
      _$ReceiptsSummaryFromJson(json);
}
