import 'package:flutter/material.dart';
import 'package:vishnu_calculator/views/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vishnu Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalCulatorPage(),
    );
  }
}