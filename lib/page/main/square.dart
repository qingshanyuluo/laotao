import 'package:flutter/material.dart';
import 'package:lao_tao/page/other_home_page.dart';
import 'package:lao_tao/widget/item.dart';
import 'package:lao_tao/widget/like.dart';
import 'package:lao_tao/widget/listView.dart';

class SquarePage extends StatelessWidget {
  const SquarePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> child = [
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 40,),
                        Text("用户1"),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new PHome())),
                  ),
                  FavoriteWidget(),
                ],
              ),
            ),
            ShopItem(),
            Container(child: Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjsfddsf发撒打算多发法撒旦飞洒地方就法撒旦范德萨jjjjjjjjjjjjjjjjjjj", style: TextStyle(fontSize: 20),),)
          ]
      )),
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 40,),
                        Text("用户1"),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new PHome())),
                  ),
                  FavoriteWidget(),
                ],
              ),
            ),
            ShopItem(),
            Container(child: Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjsfddsf发撒打算多发法撒旦飞洒地方就法撒旦范德萨jjjjjjjjjjjjjjjjjjj", style: TextStyle(fontSize: 20),),)
          ]
      )),
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 40,),
                        Text("用户1"),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new PHome())),
                  ),
                  FavoriteWidget(),
                ],
              ),
            ),
            ShopItem(),
            Container(child: Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjsfddsf发撒打算多发法撒旦飞洒地方就法撒旦范德萨jjjjjjjjjjjjjjjjjjj", style: TextStyle(fontSize: 20),),)
          ]
      )),
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 40,),
                        Text("用户1"),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new PHome())),
                  ),
                  FavoriteWidget(),
                ],
              ),
            ),
            ShopItem(),
            Container(child: Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjsfddsf发撒打算多发法撒旦飞洒地方就法撒旦范德萨jjjjjjjjjjjjjjjjjjj", style: TextStyle(fontSize: 20),),)
          ]
      )),
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 40,),
                        Text("用户1"),
                      ],
                    ),
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new PHome())),
                  ),
                  FavoriteWidget(),
                ],
              ),
            ),
            ShopItem(),
            Container(child: Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjsfddsf发撒打算多发法撒旦飞洒地方就法撒旦范德萨jjjjjjjjjjjjjjjjjjj", style: TextStyle(fontSize: 20),),)
          ]
      )),
    ];
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("广场"),),
        body: Center(child: ScrollControllerTestRoute(child),),
      ),
    );
  }
}