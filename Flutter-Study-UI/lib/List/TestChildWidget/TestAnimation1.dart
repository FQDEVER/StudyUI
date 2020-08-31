//使用Animation做动画

import 'package:flutter/material.dart';

class TestAnimationPage1 extends StatelessWidget {
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
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: TestAnimation1(),
      ),
    );
  }
}

class TestAnimation1 extends StatefulWidget {
  @override
  _TestAnimation1State createState() => _TestAnimation1State();
}

class _TestAnimation1State extends State<TestAnimation1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: MaterialButton(
            onPressed: () {
              controller.reset();
              controller.forward();
            },
            child: Text(
              "start",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
        Text(
          "value" + "$animationValue",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        Text(
          "status" + "$animationStatus",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        Container(
          height: animationValue,
          width: animationValue,
          child: FlutterLogo(),
        ),
        Text(
          "学习Row以及Column",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Column(
            //所有的横竖方向都是默认主轴占满.次轴以子类最大的尺寸来作为尺寸.
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 20,
                      color: Colors.red,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      color: Colors.green,
                    ),
                    flex: 2,
                  ),
                ],
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        height: 10,
                      ),
                      flex: 2,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        height: 20,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Text(
                "学习Wrap以及Chip",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                child: Wrap(
                  spacing: 35,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print("点击文本1");
                      },
                      child: Chip(
                        label: Text("文本1"),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text("A"),
                        ),
                      ),
                    ),
                    Chip(
                      label: Text("文本2"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text("B"),
                      ),
                    ),
                    Chip(
                      label: Text("文本3"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text("C"),
                      ),
                    ),
                    Chip(
                      label: Text("文本4"),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text("D"),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "学习Stack以及Positioned",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  textDirection: TextDirection.rtl,
                  fit: StackFit.loose,
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("data"),
                    ),
                    Text("data"),
                    Positioned(
                      child: Text("Positioned1"),
                      top: 20,
                      right: 20,
                    ),
                    Positioned(
                      child: Text("Positioned2"),
                      left: 20,
                      bottom: 20,
                    ),
                  ],
                ),
              ),
              Text(
                "学习Align",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2.0,
                  heightFactor: 2.0,
                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
              Text(
                "学习Alignment以及FractionalOffset布局",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2.0,
                  heightFactor: 2.0,
//                  alignment: Alignment(2.0, 0.0),//实际计算方式是aligment.x*childWidth * 0.5 + childwidth*0.5,aligment.y*childheight * 0.5 + childheight * 0.5,
                alignment: FractionalOffset(0.2, 1.0),//实际计算方式是fractionalOffset.x*childwidth,fractionalOffset.y*childheight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
