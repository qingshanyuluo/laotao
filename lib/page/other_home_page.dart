import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PHome extends StatelessWidget {
  PHome(this.type);
  String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 70, top: 10),
                  child: Image.network("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1700741544,1951185347&fm=26&gp=0.jpg", height: 60,),  
                ),
                Container(child: CupertinoButton(
                  padding: EdgeInsets.only(right: 50),
                  child: Text("账号详情",style: TextStyle(color: Colors.orange),),
                  onPressed: (){},
                  ),)
              ],),
              
              Container(
                padding: EdgeInsets.only(left: 60),
                child: Row(
                  children: <Widget>[
                    Text("青山雨落", style: TextStyle(fontSize: 20),),
                    Text("v14")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Text('这个人很懒什么也没留下...'),
              ),
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.eye),
                    Text("90 关注  "),
                    Icon(CupertinoIcons.eye),
                    Text("1 粉丝"),
                  ],
                )
              )

            ],
          ),
          
          Column(
            children: <Widget>[

            ],
          )
        ],
      ),
      )
      
    );
  }
}