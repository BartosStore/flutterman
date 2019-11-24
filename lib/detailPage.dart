import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact detail"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("Name: John Snow"),
          Text("Surname: John Snow"),
          Text("Profession: Warrior"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go back"),
          ),
        ],
      )),
    );
  }
}
