import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lao_tao/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LandRPage extends StatefulWidget {
  LandRPage({Key key}) : super(key: key);

  _LandRPageState createState() => _LandRPageState();
}

class _LandRPageState extends State<LandRPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  // bool _obsecure = false;
  String tip = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            logo(),
            _button("登录", Color.fromARGB(111, 111, 111, 111), Color.fromRGBO(222, 222, 222, 1.0), Color.fromRGBO(33, 121, 153, 0.9), Colors.black, _loginSheet),
            _button("注册", Color.fromARGB(111, 111, 111, 111), Color.fromRGBO(222, 222, 222, 1.0), Color.fromRGBO(223, 221, 253, 0.9), Colors.black, _registerSheet),
            _button("游客登录", Color.fromARGB(111, 111, 111, 111), Color.fromRGBO(222, 222, 222, 1.0), Color.fromRGBO(223, 221, 253, 0.9), Colors.black, _noAccentLogin),
            
          ],
        ));
  }

  void _loginSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _emailController.clear();
                            _passwordController.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  height: 50,
                  width: 50,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(tip),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 60),
                        child: _input(Icon(Icons.email), "EMAIL",
                            _emailController, false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: _input(Icon(Icons.lock), "PASSWORD",
                            _passwordController, true),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: _button("登录", Colors.blue, Colors.black12,
                              Colors.blue, Colors.blueGrey, _loginUser),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      );
    });
  }

  void _registerSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _emailController.clear();
                            _passwordController.clear();
                            _nameController.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  height: 50,
                  width: 50,
                ),
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Align(
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 25, right: 40),
                              child: Text(
                                "REGI",
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Positioned(
                            child: Align(
                              child: Container(
                                padding: EdgeInsets.only(top: 40, left: 28),
                                width: 130,
                                child: Text(
                                  "STER",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(tip),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        top: 60,
                      ),
                      child: _input(Icon(Icons.account_circle),
                          "DISPLAY NAME", _nameController, false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.email), "EMAIL",
                          _emailController, false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _input(Icon(Icons.lock), "PASSWORD",
                          _passwordController, true),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        child: _button("REGISTER", Colors.blue, Colors.black12,
                            Colors.blue, Colors.blueGrey, _registerUser),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      );
    });
  }
//花里胡少 三个圆圈
  Widget logo() {
  return Center(
      child: Padding(
    padding: EdgeInsets.only(top: 120),
    child: Container(
      // width: MediaQuery.of(context).size.width,
      height: 240,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            child: Align(
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                width: 150,
                height: 150,
              ),
              alignment: Alignment.center,
            ),
            height: 154,
          )),
          Positioned(
            child: Container(
                height: 154,
                // width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "饕",
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      // color: Theme.of(context).primaryColor,
                    ),
                  ),
                )),
          ),
          Positioned(
            width: 60,
            height: 60,
            top: 140,
            left: 260,
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          Positioned(
            width: 30,
            height: 30,
            top: 200,
            left: 230,
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  ));
}

//input widget
  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Colors.white10),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }

  Widget _button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
        function();
      },
    );
  }

    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
      var data = {'email': _email, 'password': _password};
      MyApp.getHttp("login", data).then((val){
        print(val.toString());
        Map<String, dynamic> resMap = jsonDecode(val.toString());
        print(resMap);
        // var response = new UniResponse.fromJson(resMap);
        if (resMap['code'] == 200) {
          if (resMap['data']['isMatch'] == true) {
            // print("登录成功");
            setShareData("username", _email);
            setShareData("password", _password);
            setShareData("displayname", resMap['data']['displayName']);
            setShareData("userid", resMap['data']['userId']);
            
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: "登录成功");
          } else {
            Fluttertoast.showToast(msg: "密码错误");
          }
        } else {
          Fluttertoast.showToast(msg: "登录失败");
        }
      });
    }

    void _registerUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _displayName = _nameController.text;
      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();
      var data = {'email': _email, 'password': _password, 'displayName': _displayName};
      MyApp.getHttp("register", data).then((val){
        print(val.toString());
        Map<String, dynamic> resMap = jsonDecode(val.toString());
        print(resMap);
        if (resMap['code'] == 200) {
          if (resMap['data']['isSuccess'] == true) {
            Fluttertoast.showToast(msg: "注册成功").then((v){
              sleep(Duration(seconds: 1));
              Fluttertoast.showToast(msg: "已自动登录");
            });
            // print("登录成功");
            setShareData("username", _email);
            setShareData("password", _password);
            setShareData("displayname", _displayName);
            setShareData("userid", resMap['data']['userId']);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          } else {
            print(resMap);
            // print("密码错误");
            setState(() {
              tip = "注册失败";
            });
          }
        } else {
          print(resMap);
          // print("登录失败");
          setState(() {
            tip = "注册失败";
          });
        }
      });
    }

    void _noAccentLogin(){
      Navigator.pop(context);
    }

}