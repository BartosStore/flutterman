import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class QrCode extends StatefulWidget {
  @override
  QrCodeState createState() => QrCodeState();
}

class QrCodeState extends State<QrCode> {
  String _code;

  void _scanCode() async {
    try {
      String code = await BarcodeScanner.scan();
      this.setState(() {
        this._code = code;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Code: ${this._code}'),
          RaisedButton.icon(
            icon: Icon(Icons.scanner),
            label: Text('Scan code'),
            onPressed: _scanCode,
            color: Colors.green,
            textColor: Colors.white,
          ),
        ],
      )),
    );
  }
}
