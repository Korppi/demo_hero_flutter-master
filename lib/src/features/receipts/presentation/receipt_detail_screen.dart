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
                  Text(receipt.merchant.name,
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(receipt.receiptNumber),
                  const Divider(
                    thickness: 4,
                  ),
                  for (var product in receipt.products)
                    ListTile(
                      title: Text(product.name),
                      subtitle: Text('Quantity: ${product.quantity}'),
                      trailing: Text(
                          '${product.totalAmountIncVAT} ${receipt.currencyISOCode}'),
                    ),
                  const Divider(
                    thickness: 4,
                  ),
                  Container(
                    color: Colors.amber[200],
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                              'Total price: ${receipt.totalPriceIncVAT} ${receipt.currencyISOCode}'),
                        ),
                      ],
                    ),
                  ),
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
