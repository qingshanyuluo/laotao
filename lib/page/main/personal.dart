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
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Container(child: Image.asset("img/tou.png"),padding: EdgeInsets.fromLTRB(10, 3, 3, 3),),
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
                    
                  ],),
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
}