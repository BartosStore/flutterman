import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterman/pages/camera.dart';
import 'package:flutterman/pages/githubPage.dart';
import 'package:flutterman/pages/graphql.dart';
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
    Size screen = MediaQuery.of(context).size;
    double buttonSize = (screen.width / 3);

    return Scaffold(
        appBar: AppBar(
          title: Text("Contact detail"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen)),
                  child: RaisedButton(
                    child: Text("Contact Page"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(
                                    title: 'Contacts',
                                  )));
                    },
                  ),
                ),
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen)),
                  child: RaisedButton(
                    child: Text("Net Page"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NetPage()));
                    },
                  ),
                ),
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen)),
                  child: RaisedButton(
                    child: Text("Github Page"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GithubPage()));
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: buttonSize,
                  width: buttonSize,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen)),
                  child: FutureBuilder(
                    future: _camera,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return RaisedButton(
                          child: Text("Camera"),
                          color: Colors.green,
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
                ),
                Container(
                    height: buttonSize,
                    width: buttonSize,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen)),
                    child: RaisedButton(
                      child: Text('QR Code'),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QrCode()));
                      },
                    )),
                Container(
                    height: buttonSize,
                    width: buttonSize,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen)),
                    child: RaisedButton(
                      child: Text('GraphQl'),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Graphql()));
                      },
                    ))
              ],
            )
          ],
        ));
  }
}
