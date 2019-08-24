
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/widget/item.dart';
import 'package:lao_tao/widget/searchW.dart';
import 'package:lao_tao/widget/swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    // TextEditingController typeController;
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: 22, color: Colors.orange,),
          Container(
            height: 95,
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 30,
                  padding: EdgeInsets.fromLTRB(19, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(CupertinoIcons.location_solid),
                      Text('天津')
                    ],
                  )
                ),
                Center(
                  child: RaisedButton(
                    child: Container(
                      // color: Color.fromRGBO(222, 2, 222, 0.7),
                      height: 45,
                      width: 300,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Icon(CupertinoIcons.search),
                        Center(
                          child: Text("搜索好店名称",textWidthBasis: TextWidthBasis.longestLine,)
                        ),
                        Icon(CupertinoIcons.mic)
                      ],),
                    ),
                    color: Color.fromRGBO(255, 255, 200, 0.9),
                    onPressed: (){showSearch(context: context, delegate: SearchBarDelegate());},
                  ),
                ),
              ],
          ),),
          Expanded(
            child: ListView(
              // padding: ,
              padding: EdgeInsets.all(0),
              children: <Widget>[
                SwiperPage(),
                Center(child: Text("精选好店",style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20),),),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
              ],
           ),
          )
        ]
      )
    );
  }
}