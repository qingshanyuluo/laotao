import 'package:flutter/material.dart';
import 'package:lao_tao/main.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setShareData("key", TimeOfDay.now().toString());
              },
              child: Text("存"),
            ),
            Text(getShareDate("key").toString()),
          ],
        )
      ),
    );
  }
}