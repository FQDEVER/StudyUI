
import 'dart:ui';

import 'package:flutter/material.dart';

class FunctionalContentPage extends StatefulWidget {
  @override
  _FunctionalContentPageState createState() => _FunctionalContentPageState();
}

class _FunctionalContentPageState extends State<FunctionalContentPage> {
  Color _themColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
          primarySwatch: _themColor,
          iconTheme: IconThemeData(color: _themColor),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "测试标题",
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.build),
                  Icon(Icons.card_giftcard),
                  Text("随着主题变化"),
                ],
              ),
              Theme(
                data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.build),
                    Icon(Icons.card_giftcard),
                    Text("固定黑色变化"),
                  ],
                ),
              ),
              FutureBuilder<String>(
                  future: mockNetworkData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text("contents:${snapshot.error}");
                      } else {
                        return Text("contents:${snapshot.data}");
                      }
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
              StreamBuilder(stream: counter(),builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasError){
                  return Text("Error:${snapshot.error}");
                }else{
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Text("没有stream");
                    case ConnectionState.waiting:
                      return Text("等待数据");
                    case ConnectionState.active:
                      return Text("active:${snapshot.data}");
                    case ConnectionState.done:
                      return Text("stream已关闭");
                  }
                }
                return null;
              })],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _themColor =
                    _themColor == Colors.teal ? Colors.amber : Colors.teal;
              });
            },
            child: Icon(Icons.g_translate),
          ),
        ));
  }
}

Stream<int>counter(){
  return Stream.periodic(Duration(seconds: 1),(i){
    return i;
  });
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "互联网来的数据");
}

////颜色与主题色
//class FunctionalContentPage extends StatefulWidget {
//  @override
//  _FunctionalContentPageState createState() => _FunctionalContentPageState();
//}
//
//class _FunctionalContentPageState extends State<FunctionalContentPage> {
//  Color _themeColor = Colors.teal;
//
//  @override
//  Widget build(BuildContext context) {
//    ThemeData themeData = Theme.of(context);
//    return Theme(
//      data: ThemeData(
////        primaryColor: _themeColor, //用于导航栏.floatActionButton的背景色
//        primarySwatch: _themeColor,
//        iconTheme: IconThemeData(color: _themeColor), //用于icon的颜色
//      ),
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("主题测试"),
//        ),
//        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Icon(Icons.card_giftcard),
//                Icon(Icons.gamepad),
//                Text("颜色跟随主题"),
//              ],
//            ),
//            Theme(
//                data: themeData.copyWith(
//                    iconTheme:
//                        themeData.iconTheme.copyWith(color: Colors.black)),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Icon(Icons.card_giftcard),
//                    Icon(Icons.gamepad),
//                    Text("颜色固定为黑色"),
//                  ],
//                )),
//          ],
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            setState(() {
//              _themeColor =
//                  _themeColor == Colors.teal ? Colors.blue : Colors.teal;
//            });
//          },
//          child: Icon(Icons.pages),
//        ),
//      ),
//    );
//  }
//}

////数据共享相关
//class FunctionalContentPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//        color: Colors.white,
//      ),
//      child: CustomScrollView(
//        slivers: [
//          SliverAppBar(
//            pinned: true,
//            expandedHeight: 120,
//            flexibleSpace: FlexibleSpaceBar(
//              title:Text(
//                "标题",
//                style: TextStyle(color: Colors.orange, fontSize: 12),
//              ),
//              background: Image.asset(
//                "./assets/images/insta_logo.png",
//                fit: BoxFit.cover,
//              ),
//            ),
//          ),
//          SliverPadding(
//            padding: EdgeInsets.all(8.0),
//            sliver: SliverFixedExtentList(
//                delegate: SliverChildBuilderDelegate(
//                  (BuildContext build, int index) {
//                    return Container(
//                      child: Center(
//                        child: InheritedWidgetTestRoute(),
////                        Text("data",style: TextStyle(color: Colors.black,fontSize: 15),),
//                      ),
//                    );
//                  },
//                  childCount: 1,
//                ),
//                itemExtent: 600),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class InheritedWidgetTestRoute extends StatefulWidget {
//  @override
//  _InheritedWidgetTestRouteState createState() =>
//      _InheritedWidgetTestRouteState();
//}
//
//class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
//  int count = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: ShareDataWidget(
//        data: count,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Padding(
//              padding: EdgeInsets.all(20),
//              child: _TestWidget(),
//            ),
//            RaisedButton(
//                child: Text("change"),
//                onPressed: () {
//                  setState(() {
//                    ++count;
//                  });
//                }),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class _TestWidget extends StatefulWidget {
//  @override
//  __TestWidgetState createState() => __TestWidgetState();
//}
//
//class __TestWidgetState extends State<_TestWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.blue,
//      padding: EdgeInsets.all(10),
//      child: Text(ShareDataWidget.of(context).data.toString()),
//    );
//  }
//
//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//    super.didChangeDependencies();
//    print("Dependencies change");
//  }
//}
//
//class ShareDataWidget extends InheritedWidget {
//  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
//
//  int data = 0;
//
//  static ShareDataWidget of(BuildContext context) {
//    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
//  }
//
//  @override
//  bool updateShouldNotify(ShareDataWidget oldWidget) {
//    // TODO: implement updateShouldNotify
//    return oldWidget.data != data;
//  }
//}
