import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/details_page/receipt_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiptListTile extends StatelessWidget {
  const ReceiptListTile({
    Key? key,
    required this.receipt,
    required this.dateFormat,
    required this.index,
  }) : super(key: key);

  final Receipt receipt;
  final DateFormat dateFormat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReceiptDetail(receipt.receiptNumber)),
      ),
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
  }
}
