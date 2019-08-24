import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/config/httpHeader.dart';
import 'package:lao_tao/widget/listView.dart';


class AddPage extends StatelessWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("添加好店"),),
        body: Center(child: Center(child: Text("add"),)) 
      ),
    );
  }
}














// class WeiboPage extends StatefulWidget {
//   WeiboPage({Key key}) : super(key: key);

//   _WeiboPageState createState() => _WeiboPageState();
// }

// class _WeiboPageState extends State<WeiboPage> {
//   TextEditingController typeController = TextEditingController();
//   String buttonText = "hhhhhhhhhh";
//   String showText = "hhhhhhhhhh";
  
//   @override
//     Widget build(BuildContext context) {
//     return Container(
//        child:  Scaffold(
//         appBar: AppBar(title: Text('获取微波数据'),),
//         body: Container(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _choiceAction,
//                 child: Text('发送'),
//               ),
//               Text(
//                 showText,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 3,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _choiceAction(){
//     print("jjjjjjjjjjjjjjjjjjjjjj");

//       getHttp(typeController.text.toString()).then((val){
//         setState(() {
//           print(val);
//           showText = val.toString();
//         });
//       });
//   }

//   Future getHttp(String typedText) async{
//     try {
//       Response response;
//       Options options = Options(headers: httpHeader);
//       response = await Dio().post("https://m.weibo.cn/api/container/getIndex?type=uid&value=2803301701&containerid=1005052803301701",options: options);
//       print(response);
//       return response.data;
//     } catch (e) {
//       print(e);
//     } 
//   }
// }