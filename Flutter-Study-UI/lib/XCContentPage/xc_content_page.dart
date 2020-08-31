import 'dart:wasm';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

const APP_SCROLL_OFFSET_MAX = 160.0;

class XCContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.white,
//          brightness: Brightness.light,
//          title: SizedBox(
//            height: 35,
//            child: Image.asset("assets/images/insta_logo.png"),
//          ),
//        ),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: XCContentWidgetView(),
        ),
      ),
    );
  }
}

class XCContentWidgetView extends StatefulWidget {
  @override
  _XCContentWidgetViewState createState() => _XCContentWidgetViewState();
}

class _XCContentWidgetViewState extends State<XCContentWidgetView> {
  double appbarOpacity = 0;
  Future<int> clickCount;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String showStr = "";
  int countValue = 0;
  List<String> citys = ["城市1","城市2","城市3","城市4","城市5","城市6"];
  ScrollController _scrollController = ScrollController();

  //加1操作
  Future<void> _clickChangeCount() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt("counter") ?? 0) + 1;
    setState(() {
      //clickCount =
      prefs.setInt("counter", counter).then((value) => counter);
      showStr += "1";
    });
  }

  //获取存储的值
  Future<void> _getChangeCount() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      countValue = prefs.getInt("counter");
    });
  }

  //获取存储的值
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      citys = citys.reversed.toList();
    });
    return null;
  }

  _onScroll(offset) {
    print(offset);
    setState(() {
      double offsetY = offset / (APP_SCROLL_OFFSET_MAX - 84.0);
      if (offsetY < 0) {
        offsetY = 0;
      } else if (offsetY > 1) {
        offsetY = 1;
      }
      appbarOpacity = offsetY;
    });
  }

  Future<Null> _loadMoreData() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      citys = citys.reversed.toList();
    });
    print(citys);
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _loadMoreData();
      }
    });
    super.initState();
    _getChangeCount();
  }

  List<Widget>_buildList(){
    return citys.map((cityStr) => _item(cityStr)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        NotificationListener(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollUpdateNotification &&
                scrollNotification.depth == 0) {
              _onScroll(scrollNotification.metrics.pixels);
            }
            return true;
          },
          child: RefreshIndicator(onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              Container(
                color: Colors.orange,
                height: 160.0,
                child: Swiper(
                  itemWidth: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      child: Center(
                        child: Text(
                          "$index",
                          style: TextStyle(
                              backgroundColor: Colors.lightBlueAccent,
                              fontSize: 128,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 20),
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                        size: 3.0,
                        activeColor: Colors.black,
                        activeSize: 8.0,
                      )),
//            control: SwiperControl(
//                color: Colors.red, disableColor: Colors.blue, size: 30),
//              layout: SwiperLayout.STACK,
                ),
              ),
//              Container(
//                height: 800,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    MaterialButton(onPressed: _clickChangeCount,child: Text("加1")),
//                    Text(showStr),
//                    MaterialButton(onPressed: _getChangeCount,child: Text("结果"),),
//                    Text("$countValue"),
//                  ],
//                ),
//              )
              Container(
                height: 800,
                child: ExpansionTile(
                  backgroundColor: Colors.black12,
                  onExpansionChanged: (onOpen) {
                    print("----------------->$onOpen");
                  },
                  title: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("背景"),
                        MaterialButton(
                          onPressed: () {
                            print("----------------->");
                          },
                          child: Text("点击响应"),
                        ),
                        Text("背景"),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: MaterialButton(
                        onPressed: _clickChangeCount,
                        child: Text("加1"),
                        color: Colors.orange,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Text(
                        showStr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            backgroundColor: Colors.lightBlueAccent,
                            fontSize: 15),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: MaterialButton(
                        color: Colors.black38,
                        onPressed: _getChangeCount,
                        child: Text("结果"),
                      ),
                    ),
                    Text("$countValue"),
                  ],
                ),
              ),
              Container(
                height: 100,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: _buildList(),
                ),
              ),
            ],
          ),
          ),
        ),
        Opacity(
          opacity: appbarOpacity,
          child: Container(
            alignment: Alignment.center,
            height: 84,
            color: Colors.white,
            child: Text(
              "首页",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      width: 100,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
