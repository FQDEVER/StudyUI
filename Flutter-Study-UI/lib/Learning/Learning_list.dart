import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Home/Instagram_home.dart';
import 'package:flutter_insta_clone/Learning/Child_widget_pages/Based_component.dart';
import 'package:flutter_insta_clone/Learning/Child_widget_pages/Layout_Component.dart';


class LeariningListPage extends StatelessWidget {
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
        body: LeariningListWidgetPage(),
      ),
    );
  }
}

class LeariningListWidgetPage extends StatefulWidget {
  @override
  _LeariningListWidgetPageState createState() => _LeariningListWidgetPageState();
}

class _LeariningListWidgetPageState extends State<LeariningListWidgetPage> {
  List<String> datas = [
    "基础组件",
    "布局类组件"
  ];
  List<Widget> pushVcs = [
    BasedComponentPage(),
    LayoutComponentPage(),
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
