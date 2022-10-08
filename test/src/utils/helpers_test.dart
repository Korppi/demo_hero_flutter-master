import 'package:demo_hero_flutter/src/utils/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('testing helper totalPriceFromJson', (tester) async {
    var result = totalPriceFromJson(200);
    expect(result, 2.0);
  });
}
