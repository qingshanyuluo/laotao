import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lao_tao/page/main/personal.dart';
import 'package:lao_tao/page/main/add.dart';
import 'package:lao_tao/page/main/square.dart';

import 'main/home.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() =>
    _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('主页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.add_circled),
        title: Text('添加')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.clock_solid),
        title: Text('广场')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('个人中心')
    ),

  ];
  final List tabBody = [
    HomePage(),
    AddPage(),
    SquarePage(),
    PersonalPage(),
  ];

  int currentIndex = 0;
  var currentPage;


  @override
  void initState() {
    currentPage = tabBody[currentIndex];
    super.initState();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context){return LandRPage();}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBody[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }

}