import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/page/info.dart';
import 'package:lao_tao/page/other_home_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'like.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      // margin: EdgeInsets.all(5),
      // padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context){
              return ShopInfoPage();
            }
          ));
        },
        child: Row(
          children: <Widget>[
            Image.asset("img/dian.jpg",width: 130,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Text("海底捞", style: TextStyle(fontSize: 19),),),
                  Row(
                    children: <Widget>[
                      SmoothStarRating(
                        allowHalfRating: true,
                        // onRatingChanged: (v) {
                        //   rating = v;
                        //   // setState(() {});
                        // },
                        starCount: 5,
                        rating: 3.5,
                        size: 20.0,
                        color: Colors.green,
                        borderColor: Colors.green,
                        spacing:0.0
                      ),
                      Center(child: Text("14条"),),
                      Icon(CupertinoIcons.eye),
                      Container(child: Text("70/人"),),
                    ],
                  ),
                  Text("火锅"),
                  Center(child: Text("13区 精武门"),)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}


class RemarkItem extends StatelessWidget {
  const RemarkItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(5),
        color: Colors.white,
        padding: EdgeInsets.all(7),
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
            Container(padding: EdgeInsets.fromLTRB(50, 2, 3, 10),child: Center(child: Text("评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评"),),)
          ],
        ),
      ),
    );
  }
}