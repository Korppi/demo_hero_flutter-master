import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/receipt_list_tile.dart';
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
      itemCount: data.length,
      prototypeItem: ReceiptListTile(
        receipt: data.first,
        dateFormat: dateFormat,
        index: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final receipt = data[index];
        return ReceiptListTile(
          receipt: receipt,
          dateFormat: dateFormat,
          index: index,
        );
      },
    );
  }
}
