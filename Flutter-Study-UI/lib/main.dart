
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_insta_clone/Instagram_TabBar.dart';

void main() {
  runApp(new MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(),
      home: TabNavigator() ,//ScrollNotificationTestRoute(), // new TabNavigator(),// InstagramPage(),//InstaHome(),//WillPopScopeTestRoute(),
      //
    );
  }
}

//数据共享demo




class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        )
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  ScrollController _controller = ScrollController(keepScrollOffset: false);
  String _progress = "0%"; //保存进度百分比
  bool hasTopLoading = true; // false;
  bool hasTopStartLoad = false;
  bool hasBotLoading = true; //false;
  bool hasBotStartLoad = false;
  double _offsetY = 0;
  bool hasLoadingStatusing = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("===============>$_controller.offset");
      if(hasTopStartLoad){
        _controller.jumpTo(-60);
//      _controller.animateTo(-60, duration: Duration(milliseconds: 200), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  Widget getLoadingDataWiget() {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      height: 60,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: (hasTopLoading || hasBotLoading) ? 20 : 0,
              height: (hasTopLoading || hasBotLoading) ? 20 : 0,
              child: CircularProgressIndicator(
                strokeWidth: (hasTopLoading || hasBotLoading) ? 2.0 : 0,
                backgroundColor: Colors.amber,
              ),
            ),
            SizedBox(width: (hasTopLoading || hasBotLoading) ? 10 : 0),
            Text(
              "加载中...",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            bool hasEdge = notification.metrics.atEdge;
            double offsetY = notification.metrics.pixels;
            double maxLenght = notification.metrics.maxScrollExtent;
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
              _offsetY = offsetY;
              if (offsetY < -30) {
                hasTopStartLoad = true;

//                if (hasEdge) {
//                  hasTopLoading = true;
//                } else {
//                  hasTopLoading = false;
//                }
//
              } else {
                hasTopStartLoad = false;
              }
              if (maxLenght - offsetY < -30) {
                hasBotStartLoad = true;
//                if (hasEdge) {
//                  hasBotLoading = true;
//                } else {
//                  hasBotLoading = false;
//                }
              } else {
                hasBotStartLoad = false;
              }
            });
//            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
//            print("hasEdge: ${hasEdge}");
//            print("offsetY: ${offsetY}");
//            print("maxLenght: ${maxLenght}");

            return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  controller: _controller,
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  }),
              Positioned(
                child: Container(
                  height: hasTopStartLoad ? 60 : 0,
                  child: hasTopStartLoad ? getLoadingDataWiget() : Text(""),
                ),
                left: 0,
                right: 0,
                top: 0,
                height: _offsetY.abs(), //min(100, _offsetY.abs()),
              ),
              Container(
                child: hasBotStartLoad ? getLoadingDataWiget() : Text(""),
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
