import 'package:flutter/material.dart';
import 'package:lao_tao/widget/listView.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("广场"),),
        body: Center(child: ScrollControllerTestRoute(),),
      ),
    );
  }
}