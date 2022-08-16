import 'dart:convert';

import 'package:demo_hero_flutter/src/constants/constants.dart';
import 'package:demo_hero_flutter/src/features/receipts/data/receipts_repository.dart';
import 'package:demo_hero_flutter/src/features/receipts/model/receipt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Receipt repository using json file as data source
class JsonReceiptRepository implements ReceiptRepository {
  /// In the demo we never update receipts so at the beginning we load all data
  /// and build receipts list
  final List<Receipt> receipts = [];

  @override
  Future<List<Receipt>> getReceipts() async {
    // in this demo we know there will be receipts, so this first time loader
    // should work for this demo
    if (receipts.isEmpty) {
      await _loadReceiptsFromJson(kReceiptsJsonPath);
    }
    return receipts;
  }

  @override
  Future<Receipt> getReceipt({required String id}) async {
    return receipts.firstWhere((receipt) => receipt.receiptNumber == id);
  }

  /// Loads data from json and returns list of Receipts
  Future<List<Receipt>> _loadReceiptsFromJson(String pathToJson) async {
    // * some notes about performance. after running some test it looks like
    // * jsonDecode takes ~1.5sec time to complete (and thats why i use compute function)
    // * jsonData.map took time ~0.2 sec time so it is quite alright but with bigger
    // * dataload it could be good to but inside compute as well

    final jsonString = await _loadJsonData(pathToJson);
    // spawn isolate for heavy decoding
    final jsonData = await compute(jsonDecode, jsonString) as List<dynamic>;
    final results =
        jsonData.map((receiptData) => Receipt.fromJson(receiptData)).toList();
    return results;
  }

  /// Loads receipt json inside assets folder
  Future<String> _loadJsonData(String pathToJson) async {
    final jsonString = await rootBundle.loadString(pathToJson);
    return jsonString;
  }
}

final receiptRepositoryProvider = Provider<ReceiptRepository>((ref) {
  return JsonReceiptRepository();
});
