import 'dart:ffi';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerComponentContentPage extends StatelessWidget {
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
                "容器组件",
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
        body: ContainerComponentPage(),
      ),
    );
  }
}

class ContainerComponentPage extends StatefulWidget {
  @override
  _ContainerComponentPageState createState() => _ContainerComponentPageState();
}

class _ContainerComponentPageState extends State<ContainerComponentPage> {
  int hasSelectBarItemIndex = 0;

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
          "1.填充(Padding)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
//        getRowColumnWidgets(),
        getPaddingWidgets(),
        Text(
          "2.尺寸限制容器(ConstrainedBox/SizedBox/UnconstrainedBox/AspectRatio)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getContentSizeWidgets(),
        Text(
          "3.装饰容器(DecoratedBox)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getDecoratedBoxWidgets(),
        Text(
          "4.变换(Transform)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getTransformWidgets(),
        Text(
          "5.容器(Container)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getContainerWidgets(),
        Text(
          "6.其他(Scaffold、TabBar、底部导航)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getOtherWidgets(),
        Text(
          "7.剪裁(Clip)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getClipWidgets(),
      ],
    );
  }

  Widget getClipWidgets() {
    Widget avatar = Image.asset("assets/images/UserTestIcon.png",);
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
          Text(
              "ClipOval:子组件为正方形时裁剪为内贴圆形,为矩形时,剪裁为内贴椭圆\nClipRRect:将子组件剪裁为圆角矩形\nClipRect:剪裁子组件到实际占用的矩形大小.溢出部分剪裁"),
          avatar,
          ClipOval(child: avatar,),
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              Text("Text content"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              Text("Text content"),
            ],
          ),
          DecoratedBox(decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: ClipRect(
            clipper: MyClipper(),
            child: avatar,
          ),)
        ],
      ),
    );
  }

  Widget getOtherWidgets() {
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
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("Title Bar"),
              actions: [
                IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
              ],
              leading: IconButton(icon: Icon(Icons.send), onPressed: () {}),
            ),
            drawer: Drawer(),
            endDrawer: IconButton(icon: Icon(Icons.access_alarm,color: Colors.orange,), onPressed: (){}),
            persistentFooterButtons: [
              IconButton(icon: Icon(Icons.send), onPressed: (){}),
              IconButton(icon: Icon(Icons.send), onPressed: (){}),
              IconButton(icon: Icon(Icons.send), onPressed: (){}),
            ],
            bottomSheet: Text("data"*10),
            drawerDragStartBehavior: DragStartBehavior.start,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), title: Text('Business')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school), title: Text('School')),
              ],
              currentIndex: this.hasSelectBarItemIndex,
              fixedColor: Colors.red,
              onTap: (int index) {
                setState(() {
                  this.hasSelectBarItemIndex = index;
                });
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Text("data"),
            ),
            body: Center(
              child: Text("Center Data"),
            ),
          ),
        ),
      ),
    );
  }

  Widget getContainerWidgets() {
    return Container(
//      width: 100,
//      height: 100,
      decoration: BoxDecoration(
        //背景装饰
        color: Colors.orangeAccent,
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
        gradient: LinearGradient(colors: [Colors.red, Colors.green]),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(20),
      transform: Matrix4.skewX(-0.2),
      foregroundDecoration: BoxDecoration(
        //前景装饰
        color: Colors.white30,
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            offset: Offset(-2.0, -2.0),
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      alignment: Alignment.bottomRight,
      //子控件的位置信息
      constraints: BoxConstraints(maxWidth: 100, minHeight: 100),
      child: Text("Container相当于把之前的所有容器类都包括在内的一个组合widget"),
    );
  }

  Widget getPaddingWidgets() {
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
          Container(
            color: Colors.lightBlueAccent,
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget getContentSizeWidgets() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//    尺寸限制容器(ConstrainedBox/SizedBox/UnconstrainedBox/AspectRatio
          /*
      * 相对父层级的尺寸.第一层的限制是有作用的.第二层的限制针对子容器也是有作用的
      * */
          Container(
            color: Colors.lightBlueAccent,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60, minWidth: 300),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, minWidth: 200),
                  child: Container(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            width: 200,
            child: AspectRatio(
              aspectRatio: 2.0,
              child: Container(
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDecoratedBoxWidgets() {
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
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.orange,
              //添加背景填充图.更改渲染样式.是否铺满
              image: DecorationImage(
                  image: AssetImage("assets/images/insta_logo.png"),
                  colorFilter: ColorFilter.mode(
                      Colors.transparent, BlendMode.difference),
                  repeat: ImageRepeat.noRepeat),
              border: Border.all(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                    color: Colors.red,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0),
                BoxShadow(
                    color: Colors.green,
                    offset: Offset(-2.0, -2.0),
                    blurRadius: 4.0),
              ],
              gradient:
                  LinearGradient(colors: [Colors.lightBlueAccent, Colors.red]),
            ),
            child: Container(
              width: double.infinity,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTransformWidgets() {
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 30,
            color: Colors.white,
            child: Transform(
              origin: Offset(100, 10),//偏移的y轴是origin.y * transfrom的因子就是其高度.
              alignment: Alignment.topLeft,
              transform: Matrix4.skewY(-0.3),
              child: Container(
                color: Colors.orange,
                child: Text("transform" * 2),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                color: Colors.lightBlueAccent,
                child: Transform.scale(
                  scale: 1.8,
                  child: Text(
                    "translate",
                    style: TextStyle(backgroundColor: Colors.lightGreenAccent),
                  ),
                ),
              ),
              Text(
                "TestText",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 30,
            color: Colors.lightBlueAccent,
            child: Transform.translate(
              offset: Offset(-10, -10),
              child: Text("translate"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //这里需要注意.通过transform操作widget时.只是widget放大.但是实际所占的位置未发生变化
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                color: Colors.lightBlueAccent,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Text("Rotate"),
                ),
              ),
              Text(
                "TestText",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          //对比上面的transform.rotate看.RotatedBox不会出现这种情况
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.lightBlueAccent,
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text(
                    "RotatedBox",
                    style: TextStyle(backgroundColor: Colors.lightGreenAccent),
                  ),
                ),
              ),
              Text(
                "TestText",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ],
      ),
    );
  }
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


class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}