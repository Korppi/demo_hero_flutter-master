import 'package:demo_hero_flutter/src/features/receipts/data/json_receipt_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shows details of receipt
class ReceiptDetail extends ConsumerWidget {
  final String id;
  const ReceiptDetail(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipt = ref.watch(receiptProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Hero Detail Page'),
      ),
      body: receipt.when(
          data: (receipt) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('id is $id'),
                ],
              ),
            );
          },
          error: (error, st) => Center(
                child: Text(error.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

final receiptProvider = FutureProvider.family<Receipt, String>((ref, id) {
  final repository = ref.watch(receiptRepositoryProvider);
  return repository.getReceipt(id: id);
});
