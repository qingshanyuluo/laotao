import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lao_tao/widget/item.dart';
import 'package:lao_tao/widget/like.dart';
import 'package:lao_tao/widget/swiper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';



class ShopInfoPage extends StatefulWidget {
  ShopInfoPage({Key key}) : super(key: key);

  _ShopInfoPageState createState() => _ShopInfoPageState();
}

class TabTitle {
  TabTitle(String title, int i){
    this.title = title;
    this.index = i;
  }
  String title;
  int index;
}

class _ShopInfoPageState extends State<ShopInfoPage> with SingleTickerProviderStateMixin{
  String name = '海底捞（美国13区店）';
  double rating = 3.5;
  TabController mController;
  List<TabTitle> tabList;
  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }
  
  initTabData() {
    tabList = [
      new TabTitle('店铺环境', 1),
      new TabTitle('饭菜详情', 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(title: Text(name),),
        body: Container(
          child: 
          Column(
            children: <Widget>[
              Container(
                height: 45,
                color: Colors.orange,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SmoothStarRating(
                      allowHalfRating: true,
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 25.0,
                      color: Colors.green,
                      borderColor: Colors.green,
                      spacing:0.0
                    ),
                    Container(padding: EdgeInsets.fromLTRB(10, 0, 1, 0),child: Text("14条"),),
                    // Divider(color: Colors.white, height: 0.9, indent: 6.0,),
                    Container(padding: EdgeInsets.fromLTRB(10, 0, 1, 0),child: Text("人均70元"),),
                    Container(padding: EdgeInsets.fromLTRB(10, 0, 1, 0),child: Text("火锅"),),
                  ],
                ),
              ),
              Container(
                color: new Color(0xfff4f5f6),
                height: 47.0,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  isScrollable: true,
                  //是否可以滚动
                  controller: mController,
                  labelColor: Colors.red,
                  unselectedLabelColor: Color(0xff666666),
                  labelStyle: TextStyle(fontSize: 19.0),
                  tabs: tabList.map((item) {
                    return Tab(
                      text: item.title,
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: mController,
                  children: tabList.map((item) {
                    if (item.index == 0) {
                      return ListView(children: <Widget>[
                        SwiperPage(),
                        SwiperPage(),
                        SwiperPage(),
                        SwiperPage(),
                        SwiperPage(),
                        SwiperPage(),
                      ],);
                    } else {
                      return ListView(children: <Widget>[
                        SwiperPage(),
                        Row(children: <Widget>[
                          Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: FavoriteWidget(),
                              ),
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                new Container(
                                  padding: new EdgeInsets.all(0.0),
                                  child: new IconButton(
                                    icon: Icon(Icons.chat_bubble, color: Colors.grey,),
                                    color: Colors.red[500],
                                    onPressed: (){},
                                  ),
                                ),
                                new SizedBox(
                                  // width: 18.0,
                                  child: new Container(
                                    child: new Text('550'),
                                  ),
                                ),
                              ],
                            )
                          )
                        ], mainAxisAlignment: MainAxisAlignment.start,),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                        RemarkItem(),
                      ],);
                    }
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}