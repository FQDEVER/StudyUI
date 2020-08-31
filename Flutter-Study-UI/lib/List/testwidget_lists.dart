import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Home/Instagram_home.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/Hero++/HeroAnimation2.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/HeroAnimation.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/OtherWidget.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/TestAnimation1.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/TestAnimation2.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/TestAnimation3.dart';

class TestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: SizedBox(
            height: 35,
            child: Image.asset("assets/images/insta_logo.png"),
          ),
        ),
        body: TestWidgetListPage(),
      ),
    );
  }
}

class TestWidgetListPage extends StatefulWidget {
  @override
  _TestWidgetListPageState createState() => _TestWidgetListPageState();
}

class _TestWidgetListPageState extends State<TestWidgetListPage> {
  List<String> datas = [
    "Animation方式",
    "AnimatedWidget方式",
    "AnimatedBuilder方式",
    "Hero方式",
    "Hero进阶方式",
    "OtherWidgetPage其他方式"
  ];
  List<Widget> pushVcs = [
    TestAnimationPage1(),
    TestAnimationPage2(),
    TestAnimationPage3(),
    HeroAnimationPage(),
    HeroAnimationPage2(),
    OtherWidgetPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black12,
      padding: EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.orange,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              child: Container(
                height: 44,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      datas[index],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              onTap: () {
                //跳转到指定控制器
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return pushVcs[index];
                }));
              },
            ),
          );
        },
        itemCount: datas.length,
      ),
    );
  }
}
