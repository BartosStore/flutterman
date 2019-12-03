import 'package:flutter/material.dart';
import 'package:flutterman/pages/githubPage.dart';
import 'package:flutterman/pages/listPage.dart';
import 'package:flutterman/pages/netPage.dart';

class Crossroad extends StatefulWidget {
  @override
  CrossroadState createState() {
    return CrossroadState();
  }
}

class CrossroadState extends State<Crossroad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contact detail"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Contact Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPage(title: 'Contacts',)));
              },
            ),
            RaisedButton(
              child: Text("Net Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NetPage()));
              },
            ),
            RaisedButton(
              child: Text("Github Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GithubPage()));
              },
            )
          ],
        ));
  }
}
