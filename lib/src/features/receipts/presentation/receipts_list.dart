import 'package:demo_hero_flutter/src/features/receipts/data/json_receipt_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReceiptsList extends ConsumerWidget {
  const ReceiptsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipts = ref.watch(receiptsProvider);
    return receipts.when(
        data: (data) => Center(
              child: Text('data'),
            ),
        error: (error, st) => Center(
              child: Text(error.toString()),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}

final receiptsProvider = FutureProvider<List<Receipt>>((ref) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getReceipts();
});
