// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/gift_provider.dart';
import 'screens/gift_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GiftProvider(),
      child: MaterialApp(
        title: 'Gift List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GiftListScreen(),
      ),
    );
  }
}
