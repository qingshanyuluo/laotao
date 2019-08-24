import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/main.dart';
import 'package:lao_tao/page/login_and_register.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key key}) : super(key: key);

  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  TextEditingController typeController = TextEditingController();
  String buttonText = "hhhhhhhhhh";
  @override
  Widget build(BuildContext context) {
    // print(getShareDate("key"));
    getShareDate("key").then((val){
      print(val);
    });
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("演示post提交数据"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('ddddddd演示一下 为了登录', style: TextStyle(backgroundColor: Colors.black, color: Colors.blue)),
                Text('ddddddd演示一下 为了登录', style: TextStyle(backgroundColor: Colors.black, color: Colors.blue)),
                Text('ddddddd演示一下 为了登录', style: TextStyle(backgroundColor: Colors.black, color: Colors.blue)),
                Text('ddddddd演示一下 为了登录', style: TextStyle(backgroundColor: Colors.black, color: Colors.blue)),
                Text('用户名xxxx是对的', style: TextStyle(backgroundColor: Colors.black, color: Colors.blue)),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    labelText: '请输入准备发送的文本',
                    helperText: '一段小帮助'
                  ),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,
                  color: Colors.blue,
                  child: Text(buttonText),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return LandRPage();
                      }
                    ));
                  },
                  color: Colors.blue,
                  child: Text('登录'),
                )
              ]
             ),
           ),
         ),
       ),
    );
  }

    void _choiceAction(){
    print("jjjjjjjjjjjjjjjjjjjjjj");
    if (typeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('空'),)
      );
    } else {
      getHttp(typeController.text.toString()).then((val){
        setState(() {
          print(val);
          buttonText = val.toString();
        });
      });
    }
  }

  Future getHttp(String typedText) async{
    try {
      Response response;
      var data = {'username': typeController.text.toString(), 'password': 'xxxxqq'};
      response = await Dio().post("http://10.0.2.2:8080/test",queryParameters: data);
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    } 
  }
}