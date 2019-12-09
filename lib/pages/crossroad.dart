import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterman/pages/camera.dart';
import 'package:flutterman/pages/githubPage.dart';
import 'package:flutterman/pages/listPage.dart';
import 'package:flutterman/pages/netPage.dart';
import 'package:flutterman/pages/qrCode.dart';

class Crossroad extends StatefulWidget {
  @override
  CrossroadState createState() {
    return CrossroadState();
  }
}

class CrossroadState extends State<Crossroad> {
  Future<CameraDescription> _camera;

  @override
  void initState() {
    _camera = initCamera();
    super.initState();
  }

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListPage(
                              title: 'Contacts',
                            )));
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
            ),
            FutureBuilder(
              future: _camera,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return RaisedButton(
                    child: Text("Camera"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TakePictureScreen(
                                    camera: snapshot.data,
                                  )));
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            RaisedButton(
              child: Text('QR Code'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QrCode()));
              },
            )
          ],
        ));
  }
}
