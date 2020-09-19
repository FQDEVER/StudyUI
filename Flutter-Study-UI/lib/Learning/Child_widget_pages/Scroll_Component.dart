import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScrollComponentContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                child: Image.asset("assets/images/insta_logo.png"),
              ),
              Text(
                "Scroll组件",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ],
          ),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: ScrollComponentPage(),
      ),
    );
  }
}

class ScrollComponentPage extends StatefulWidget {
  @override
  _ScrollComponentPageState createState() => _ScrollComponentPageState();
}

class _ScrollComponentPageState extends State<ScrollComponentPage> {
  List<String> words = [loadingTag];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Text(
          "1.SingleChildScrollView",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getSingleChildScrollView(),
        Text(
          "2.ListView",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getListView(),
        Text(
          "3.ListViewBuilder",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getListViewBuilder(),

        Text(
          "4.ListViewSeparated",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getListViewSeparated(),

        Text(
          "5.无限加载更多",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getListViewReloadMore(),
        Text(
          "6.GridView",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getGridView(),
      ],
    );
  }

  Widget getSingleChildScrollView() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(2, 2),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget getListView() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(2, 2),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: str
            .split("")
            .map((e) => Text(
                  e,
                  textScaleFactor: 2.0,
                ))
            .toList(),
      ),
    );
  }

  Widget getListViewBuilder() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(2, 2),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: str.length,
          itemExtent: 50, //每个的高度
          itemBuilder: (BuildContext context, int index) {
            String str1 = str.substring(index, index + 1);
            return ListTile(
              title: Text(str1),
            );
          }),
    );
  }

  Widget getListViewSeparated() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Widget divider1 = Divider(
      color: Colors.orange,
      height: 4,
    );
    Widget divider2 = Divider(
      color: Colors.white,
      height: 1,
    );
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(2, 2),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ListView.separated(
        itemCount: str.length,
        cacheExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          String str1 = str.substring(index, index + 1);
          return ListTile(
            title: Text(str1),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return (index == 2 || index == 4) ? divider1 : divider2;
        },
      ),
    );
  }

  Widget getGridView(){
    return Container();
  }

  static const String loadingTag = "##loading##";
  Widget getListViewReloadMore() {
    void _reloadMoreData() {
      Future.delayed(Duration(seconds: 2)).then((value) {
        setState(() {
          var addWords =
              generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
          words.insertAll(words.length - 1, addWords);
          print(words);
        });
      });
    }

    Widget divider1 = Divider(
      color: Colors.orange,
      height: 4,
    );
    Widget divider2 = Divider(
      color: Colors.white,
      height: 1,
    );
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(2, 2),
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ListView.separated(
        itemCount: words.length,
        cacheExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          if (words[index] == loadingTag) {
            if (words.length - 1 < 100) {
              //最后一个了
              //请求数据.并且加载进度
              _reloadMoreData();
              return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: Colors.white,
                    ),
                  ));
            } else {
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text("没有更多"),
              );
            }
          }
          String str1 = words[index];
          return ListTile(
            title: Text(str1),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return (index == 2 || index == 4) ? divider1 : divider2;
        },
      ),
    );
  }
}
