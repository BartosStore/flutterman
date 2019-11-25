import 'package:flutter/material.dart';
import 'package:flutterman/pages/netPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NetPage(), // MyHomePage(title: 'My app'),
    );
  }
}
