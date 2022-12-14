import 'package:demo_hero_flutter/src/features/receipts/data/json_receipt_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/listview_page/receipts_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shows all receipts in listview
class ReceiptsListScreen extends ConsumerWidget {
  const ReceiptsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipts = ref.watch(receiptsProvider);
    return receipts.when(
        data: (data) => ReceiptList(data),
        error: (error, st) => Center(
              child: Text(error.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

/// Provides list of receipts in repository
final receiptsProvider = FutureProvider<List<Receipt>>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getReceipts();
});
