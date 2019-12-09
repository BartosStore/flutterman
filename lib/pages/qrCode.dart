import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:vcard_parser/vcard_parser.dart';
import 'package:expandable/expandable.dart';

class QrCode extends StatefulWidget {
  @override
  QrCodeState createState() => QrCodeState();
}

class QrCodeState extends State<QrCode> {
  final vcard_tags = [
    'N',
    'ORG',
    'EMAIL;TYPE=INTERNET',
    'TEL',
    'ADR',
  ];
  final double _padding = 30;

  String _code = '';
  String _vcard = '';

  void _scanCode() async {
    try {
      String code = await BarcodeScanner.scan();

      VcardParser vcardCode = VcardParser(code);
      Map<String, Object> vcardObject = vcardCode.parse();
      Map<String, String> vcardString = new Map();

      vcardObject.forEach((key, value) {
        if (vcard_tags.contains(key)) {
          vcardString.addAll({key.toString(): value.toString()});
        }
      });

      this.setState(() {
        this._code = code;
        this._vcard = vcardString.toString();
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
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: Container(
            // color: Colors.grey,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Padding(
                padding: EdgeInsets.all(_padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, _padding),
                      child: ExpandablePanel(
                        header: Text(
                          'Code',
                          style: Theme.of(context).textTheme.body2,
                        ),
                        expanded: Text(
                          '${this._code}',
                          softWrap: true,
                        ),
                        tapHeaderToExpand: true,
                        hasIcon: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, _padding),
                      child: ExpandablePanel(
                        header: Text(
                          'Scanned card',
                          style: Theme.of(context).textTheme.body2,
                        ),
                        expanded: Text(
                          '${this._vcard.replaceAll(', ', '\n')}',
                          softWrap: true,
                        ),
                        tapHeaderToExpand: true,
                        hasIcon: true,
                      ),
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.scanner),
                      label: Text('Scan code'),
                      onPressed: _scanCode,
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
