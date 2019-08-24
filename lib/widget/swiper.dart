import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SwiperPage extends StatelessWidget {

  // // SwiperPage({this.swiperDateList});
  // SwiperPage({Key key, this.swiperDateList}) : super(key: key);

  // final List swiperDateList;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.asset("img/lunbo.jpg", fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("首页"),),
//       body: FutureBuilder(
//         // future: getSwiperImage(),
//         builder: (context, snapshot){
//           if (snapshot.hasData) {
//             var data = json.decode(snapshot.data.toString());
//             List<Map> swiper = (data['data']['slides'] as List).cast();
//             return Column(
//               children: <Widget>[
//                 SwiperPage(swiperDateList: swiper)
//               ],
//             );
//           } else {
//             return Center(
//               child: Text('加载中'),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future getSwiperImage() async {
//     try {
//       Response response;
//       response = await Dio().post("https://m.weibo.cn/api/container/getIndex?type=uid&value=2803301701&containerid=1005052803301701");
//       print(response);
//       return response.data;
//     } catch (e) {
//       print(e);
//     } 
//   }
// }