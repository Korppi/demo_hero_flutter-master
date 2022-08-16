import 'package:demo_hero_flutter/src/features/receipts/presentation/info_button.dart';
import 'package:demo_hero_flutter/src/features/receipts/presentation/receipts_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Hero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Hero'),
          actions: [
            InfoButton(),
          ],
        ),
        body: const ReceiptsListScreen(),
      ),
    );
  }
}
