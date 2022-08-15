import 'dart:convert';

import 'package:demo_hero_flutter/src/constants/constants.dart';
import 'package:demo_hero_flutter/src/features/receipts/data/receipts_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/services.dart';

/// Receipt repository using json file as data source
class JsonReceiptRepository implements ReceiptRepository {
  @override
  Future<List<Receipt>> getReceipts() async {
    final jsonString = await _loadJsonData();
    final jsonData = jsonDecode(jsonString) as List<dynamic>;
    final results =
        jsonData.map((receiptData) => Receipt.fromJson(receiptData)).toList();
    return results;
  }

  /// Loads receipt json inside assets folder
  Future<String> _loadJsonData() async {
    final jsonString = await rootBundle.loadString(kReceiptsJsonPath);
    return jsonString;
  }
}
