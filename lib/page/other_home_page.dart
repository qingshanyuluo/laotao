import 'package:flutter/material.dart';

class PHome extends StatelessWidget {
  const PHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.white,),
      body: Column(
        children: <Widget>[
          Container(color: Colors.white,height: 22,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){Navigator.of(context).pop();},
              ),
              Center(
                child: Text("个人主页，待添加"),
              ),
              IconButton(
                icon: Icon(Icons.control_point),
                onPressed: (){Navigator.of(context).pop();},
              ),
            ],
          )
        ],
      ),
    );
  }
}