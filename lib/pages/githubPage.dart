import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterman/constants.dart';
import 'package:flutterman/http/githubRepos.dart';
import 'package:flutterman/http/httpCommunication.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubPage extends StatefulWidget {
  GithubPage({Key key}) : super(key: key);

  @override
  GithubPageState createState() => GithubPageState();
}

class GithubPageState extends State<GithubPage> {
  Future<ReposList> repos;

  @override
  void initState() {
    super.initState();
    repos = HttpCommunication().fetchGithubData(Constants().githubReposUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BartosStore Github Repos"),
        ),
        body: FutureBuilder<ReposList>(
          future: repos,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return new Column(
                children: <Widget>[
                  Text('BartosStore'),
                  Text(
                      'This page list all repositories under BartosStore account.'),
                  Expanded(
                      child: new ListView.builder(
                    itemCount: snapshot.data.repos.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return new Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: DefaultTextStyle.of(ctx).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Title: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          '${snapshot.data.repos[0].getName()}',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                ],
                              ),
                            ),
                          ]),
                          Row(children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: '',
                                style: DefaultTextStyle.of(ctx).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'HTML url: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '${snapshot.data.repos[0].htmlUrl}',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      );
                    },
                  )),
                  RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan( 
                          text: "If you want to know more, check this: ",
                          style: new TextStyle(color: Colors.black),
                        ),
                        new TextSpan(
                          text: "BartosStore",
                          style: new TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://github.com/BartosStore/');
                          },
                        )
                      ]
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
