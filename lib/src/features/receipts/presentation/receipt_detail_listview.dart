import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/material.dart';

/// Shows receipt details
class ReceiptDetailListview extends StatelessWidget {
  final Receipt receipt;
  const ReceiptDetailListview(
    this.receipt, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
