import 'package:flutter/material.dart';
import 'package:flutterman/pages/detailPage.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: _counter,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: const Icon(Icons.donut_small),
                  title: Text("John Snow"),
                  onTap: () {
                    Navigator.push(ctx,
                        MaterialPageRoute(builder: (context) => DetailPage()));
                  },
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
