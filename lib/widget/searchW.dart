import 'package:flutter/material.dart';
import 'package:lao_tao/widget/item.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: SearchR(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: SearchSug(),
    );
  }


  ///  * [AppBar.backgroundColor], which is set to [ThemeData.primaryColor].
  ///  * [AppBar.iconTheme], which is set to [ThemeData.primaryIconTheme].
  ///  * [AppBar.textTheme], which is set to [ThemeData.primaryTextTheme].
  ///  * [AppBar.brightness], which is set to [ThemeData.primaryColorBrightness].
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }
}

class SearchSug extends StatelessWidget {
  const SearchSug({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 30, 300, 5),
            child: Text("历史搜索"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SearchC(),
                SearchC(),
                SearchC(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 30, 300, 5),
            child: Text("热门搜索"),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SearchC(),
                SearchC(),
                SearchC(),
              ],
            ),
          )
        ],
      )
    );
  }
}

class SearchR extends StatelessWidget {
  const SearchR({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Center(child: Text("以下为搜索结果"),),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
                ShopItem(),
              ],
            ),
          )
        ],
      ),
      // child: Flex(
      //   direction: Axis.horizontal,
      //   children: <Widget>[
          
      //     ListView.builder(
      //       itemCount: 50,
      //       itemBuilder: (BuildContext context, int index) {
      //       return ShopItem();
      //      },
      //     ),
      //   ],
      // ),
    );
  }
}

  class SearchC extends StatelessWidget {
    const SearchC({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.black26, width: 0.5), // 边色与边宽度
          color: Color(0xFFffff), // 底色
          borderRadius: new BorderRadius.circular((4.0)), // 圆角度
          // borderRadius: new BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
        ),
        height: 30,
        child: FlatButton(
          child: Text("海底捞"),
          onPressed: (){},
        ),
      );
    }
  }