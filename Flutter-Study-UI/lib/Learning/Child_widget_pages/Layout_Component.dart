import 'dart:ui';

import 'package:flutter/material.dart';

class LayoutComponentPage extends StatelessWidget {
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
            children: <Widget>[
              SizedBox(
                height: 25,
                child: Image.asset("assets/images/insta_logo.png"),
              ),
              Text(
                "布局组件",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ],
          ),
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: LayoutComponentWidgetPage(),
      ),
    );
  }
}

class LayoutComponentWidgetPage extends StatefulWidget {
  @override
  _LayoutComponentWidgetPageState createState() =>
      _LayoutComponentWidgetPageState();
}

class _LayoutComponentWidgetPageState extends State<LayoutComponentWidgetPage> {
  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 13,
  ); //,decoration: TextDecoration.lineThrough,decorationColor: Colors.red,decorationStyle: TextDecorationStyle.dotted
  //,decorationThickness:10,

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Text(
          "1.线性布局Column与Row",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getRowColumnWidgets(),
        Text(
          "2.弹性布局Expanded与Flex",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getFlexWidgets(),
        Text(
          "3.流式布局Warp与Flow",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getWrapFlowWidgets(),
        Text(
          "4.层叠式布局Stack与Position",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getStackPositionWidgets(),
        Text(
          "5.对齐相对定位Align",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getAlignWidgets(),
      ],
    );
  }

  Widget getAlignWidgets() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("相对定位Align"),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Text("相对定位Align-Alignment"),
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Align(
              alignment: Alignment(2, 0.0),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Text("相对定位Align-FractionalOffset"),
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Align(
              alignment: FractionalOffset(0.1,0.5),//x偏移是.(总宽-child宽)*x系数,y同理
              child: Container(
                color: Colors.lightGreen,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getRowColumnWidgets() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.orange,
      boxShadow: [
        BoxShadow(
          color: Colors.red,
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
    padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.grey,
              child: Text(
                "左1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              child: Text(
                "左2",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Text(
                "左3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              child: Text(
                "左1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.red,
              child: Text(
                "左2",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget getFlexWidgets() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green,
      boxShadow: [
        BoxShadow(
          color: Colors.red,
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                child: Text(
                  "左1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Text(
                  "左2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.lightBlueAccent,
                child: Text(
                  "左3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getWrapFlowWidgets() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.lightGreenAccent,
      boxShadow: [
        BoxShadow(
          color: Colors.red,
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
    padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 20,
          direction: Axis.horizontal,
          children: [
            Text("data"),
            Text("data"),
            Text("data" * 10),
            Text("data" * 10),
          ],
        ),
        Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.red,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.green,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.blue,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.yellow,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.brown,
            ),
            new Container(
              width: 80.0,
              height: 80.0,
              color: Colors.purple,
            ),
          ],
        )
      ],
    ),
  );
}

Widget getStackPositionWidgets() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.green,
      boxShadow: [
        BoxShadow(
          color: Colors.red,
          offset: Offset(2.0, 2.0),
          blurRadius: 3.0,
        ),
      ],
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),
    padding: EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  color: Colors.orangeAccent,
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                Text(
                  "FlutterLogo标签",
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.grey),
                ),
                Positioned(
                  child: Text(
                    "Positioned_Bottom_Right",
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                  bottom: 0,
                  right: 0,
                ),
                Positioned(
                  child: Text(
                    "Positioned_Top_Right",
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                  top: 0,
                  right: 0,
                ),
              ],
            ),
          ),
          flex: 5,
        ),
        Spacer(
          flex: 1,
        ),
      ],
    ),
  );
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var offsetX = margin.left;
    var offsetY = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      //获取算上当前宽的最终宽度
      var w = offsetX + context.getChildSize(i).width + margin.right;
      //如果大于容器宽度.则换行
      if (w > context.size.width) {
        offsetX = margin.left;
        w = offsetX + context.getChildSize(i).width + margin.right;
        //如果大于指定宽.那么更新高度
        offsetY = offsetY + context.getChildSize(i).height + margin.bottom;
      }
      context.paintChild(i,
          transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
      offsetX = w + margin.left;
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
