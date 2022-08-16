import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptList extends StatelessWidget {
  final List<Receipt> data;
  final DateFormat dateFormat = DateFormat.yMMMMd();

  ReceiptList(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListView.builder builds ListTiles only when needed and not all at once
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final receipt = data[index];
        return ListTile(
          tileColor: index % 2 == 0 ? Colors.grey[100] : Colors.grey[200],
          leading: CircleAvatar(
              backgroundColor: Colors.amber[200],
              child: Text(receipt.merchant.name.substring(0, 1))),
          title: Text(receipt.merchant.name),
          subtitle: Text('${receipt.products.length} products'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(dateFormat.format(receipt.receiptTimeStamp)),
              Text('${receipt.totalPriceIncVAT} ${receipt.currencyISOCode}'),
            ],
          ),
        );
      },
    );
  }
}
