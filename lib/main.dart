import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/models/state.dart';
import 'package:lao_tao/page/index_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  setShareData("username", "请登录");
  runApp(
    MyApp()
  );
} 

class MyApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '老饕餐馆',
      theme: ThemeData(
        hintColor: Color(0xFFC0F0E8),
        primaryColor: Colors.orange,
        // canvasColor: Colors.transparent,
        fontFamily: "Montserrat",
      ),
      home: IndexPage(),
      debugShowCheckedModeBanner: false,

    );
  }
  static Future getHttp(String url, data) async{
    try {
      Response response;
      response = await Dio().post("http://lennon.xyz/$url",queryParameters: data);
      // print(response);
      return response;
    } catch (e) {
      print(e);
    } 
  }
}

    setShareData(String key, dynamic value) async {
      var prefs = await SharedPreferences.getInstance();
      if (value is String) {
        await prefs.setString(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      }
    }

    Future getShareDate(String key) async {
      var prefs = await SharedPreferences.getInstance();
      if (key == "userid") {
        return prefs.getInt("userid");
      }
      var count = prefs.getString(key);
      return count;
    }