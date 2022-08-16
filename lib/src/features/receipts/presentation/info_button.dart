import 'package:demo_hero_flutter/src/features/receipts/model/receipts_summary.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/receipts_list_screen.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/summary_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Iconbutton that opens simple dialog to show some data about receipts
class InfoButton extends ConsumerWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final summary = ref.watch(summaryProvider);
    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            title: const Text('Summary of all receipts'),
            children: [
              summary.when(
                data: (data) => Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('Highest cost (EUR):'),
                          Text('Lowest cost (EUR):'),
                          Text('Receipt count:'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${data?.highestCost}'),
                          Text('${data?.lowestCost}'),
                          Text('${data?.receiptCount}'),
                        ],
                      ),
                    )
                  ],
                ),
                error: (error, st) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        },
      ),
      icon: const Icon(Icons.info),
    );
  }
}

final summaryProvider =
    StateNotifierProvider<SummaryNotifier, AsyncValue<ReceiptsSummary?>>((ref) {
  final receipts = ref.watch(receiptsProvider);
  final summary = SummaryNotifier();
  receipts.whenData((data) => summary.buildSummary(data));
  return summary;
});
