import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello/calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arya Solutions',
      home: Scaffold(
          body:  Calculator(),
          ),
    );
  }
}
