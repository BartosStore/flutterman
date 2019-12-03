import 'package:flutter/material.dart';
import 'package:flutterman/constants.dart';
import 'package:flutterman/http/githubRepos.dart';
import 'package:flutterman/http/httpCommunication.dart';
import 'package:flutterman/pages/listPage.dart';

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
              return ListView.builder(
                itemCount: snapshot.data.repos.length,
                itemBuilder: (BuildContext ctx, int index) {
                  // return new Text(snapshot.data.repos[index].name);
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '${snapshot.data.repos[0].getName()}',
                                  style:
                                      TextStyle(fontStyle: FontStyle.italic)),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '${snapshot.data.repos[0].htmlUrl}',
                                  style:
                                      TextStyle(fontStyle: FontStyle.italic)),
                            ],
                          ),
                        ),
                      ])
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ));
  }
}
