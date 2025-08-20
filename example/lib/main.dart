import 'package:flutter/material.dart';
import 'package:base_box/base_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBox(
        onTap: () {},
        marginAll: 20,
        height: 50,
        width: 50,
        tooltip: 'alarm',
        borderWidth: 1.8,
        borderColor: Colors.black,
        radius: 16,
        color: Colors.red,
        child: Icon(Icons.access_alarm),
      ),
    );
  }
}
