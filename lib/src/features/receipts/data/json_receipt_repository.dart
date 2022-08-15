import 'dart:convert';

import 'package:demo_hero_flutter/src/features/receipts/data/receipts_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/services.dart';

class JsonReceiptRepository implements ReceiptRepository {
  @override
  Future<List<Receipt>> getReceipts() async {
    final results = await _getReceiptsFromJson();
    return results;
  }

  Future<List<Receipt>> _getReceiptsFromJson() async {
    final jsonString = await _loadJsonData();
    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    final results =
        jsonData.map((receiptData) => Receipt.fromJson(receiptData)).toList();

    return results;
  }

  Future<String> _loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/receipts.json');
    return jsonString;
  }
}
