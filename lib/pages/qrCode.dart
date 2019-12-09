import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code'),),
      body: Text('Here we will scan QR codes...'),
    );
  }
}