import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipts_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifier for [ReceiptsSummary] with methods to build data in isolate
class SummaryNotifier extends StateNotifier<AsyncValue<ReceiptsSummary?>> {
  SummaryNotifier() : super(const AsyncValue.data(null));

  /// builds summary data in isolate
  Future<void> buildSummary(List<Receipt> data) async {
    state = const AsyncValue.loading();
    final result = await compute(buildSummaryData, data);
    state = AsyncValue.data(result);
  }
}

/// Used in isolation to calculate all kinds of receipts data
///
/// Highest and lowest are both only in EUR for this demo.
ReceiptsSummary buildSummaryData(List<Receipt> data) {
  int highest = -1;
  int lowest = -1;
  for (var receipt in data) {
    if (receipt.currencyISOCode == 'EUR') {
      if (highest == -1 || highest < receipt.totalPriceIncVAT) {
        highest = receipt.totalPriceIncVAT;
      }
      if (lowest == -1 || lowest > receipt.totalPriceIncVAT) {
        lowest = receipt.totalPriceIncVAT;
      }
    }
  }
  return ReceiptsSummary(
      highestCost: highest, lowestCost: lowest, receiptCount: data.length);
}
