import 'package:flutter/material.dart';
import 'package:flutterman/constants.dart';
import 'package:flutterman/http/httpCommunication.dart';
import 'package:flutterman/pages/listPage.dart';
import 'package:flutterman/http/post.dart';

class NetPage extends StatefulWidget {
  NetPage({Key key}) : super(key: key);

  @override
  NetPageState createState() => NetPageState();
}

class NetPageState extends State<NetPage> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = HttpCommunication().fetchData(Constants().publicUrlTest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact detail"),
      ),
      body: FutureBuilder<Post>(
        future: post,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(ctx).style,
                        children: <TextSpan>[
                          TextSpan(text: 'Title: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${snapshot.data.title.substring(0, 20)}', style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ]
                ),
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(ctx).style,
                        children: <TextSpan>[
                          TextSpan(text: 'Response body: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${snapshot.data.body}', style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ]
                ),
                RaisedButton(
                  child: Text("Go to Contact Page"),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => ListPage(title: 'Text'))
                    );
                  },
                )
              ]
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      )
    );
  }
}
