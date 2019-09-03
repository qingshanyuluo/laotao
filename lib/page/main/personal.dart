import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/main.dart';
import 'package:lao_tao/page/login_and_register.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key key}) : super(key: key);

  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  TextEditingController typeController = TextEditingController();
  String usename = "尚未登录";
  @override
  Widget build(BuildContext context) {
    // print(getShareDate("key"));
    getShareDate("username").then((val){
      print(val);
      setState(() {
        usename = val;
      });
    });
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的"),
        ),
        body: Container(
          color: Colors.grey,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(1),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Container(child: Image.asset("img/tou.png"),padding: EdgeInsets.fromLTRB(10, 3, 3, 3),),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(child: Container(
                          // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("小甜甜", style: TextStyle(fontSize: 25),),
                              Text("账号: " + usename, style: TextStyle(fontSize: 15),)
                            ],
                          ),
                        ),),
                        IconButton(
                          icon: Icon(CupertinoIcons.right_chevron),
                          onPressed: login,
                        )
                      ],
                    ),)
                  ],),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SingleItem(string1: "当前等级", string2: "5级",),
                      SingleItem(string1: "成功分享", string2: "5家",),
                      SingleItem(string1: "评论总数", string2: "50条",),
                      SingleItem(string1: "点赞总数", string2: "50条",),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: <Widget>[
                            Container(padding: EdgeInsets.all(10), child: Text("我的主页", style: TextStyle(fontSize: 18),),),
                            IconButton(icon: Icon(CupertinoIcons.right_chevron), onPressed: toPersonalHomePage,)
                          ],
                        ),
                        CupertinoButton(
                          onPressed: (){
                            setShareData("logined", "false");
                            setShareData("username", "请登录");
                            setShareData("password", "请登录");
                            setShareData("displayname", "请登录");
                            login();
                          }, 
                          child: Text("退出登录", style: TextStyle(color: Colors.red),),)
                      ],

                    ),
                  )
                )
              ],    
            ),
          ),
         ),
       ),
    );
  }

  void login(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return LandRPage();
      }
    ));
  }

  void toPersonalHomePage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return LandRPage();
      }
    ));
  }
}

class SingleItem extends StatelessWidget {
  final String string1;
  final String string2;
  const SingleItem({Key key,this.string1, this.string2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(padding: EdgeInsets.all(6), child: Text(string1, style: TextStyle(fontSize: 18),),),
          Container(child: Text(string2, style: TextStyle(fontSize: 25),),)
        ],
      ),
    );
  }
}