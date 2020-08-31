import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/DataTool/appbar_widget.dart';
import 'package:flutter_insta_clone/DataTool/myIcons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/OtherWidget.dart';


class BasedComponentPage extends StatelessWidget {
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
                "基础组件",
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
        body: BasedComponentWidgetPage(),
      ),
    );
  }
}

class BasedComponentWidgetPage extends StatefulWidget {
  @override
  _BasedComponentWidgetPageState createState() =>
      _BasedComponentWidgetPageState();
}

class _BasedComponentWidgetPageState extends State<BasedComponentWidgetPage> {
  //记录发送按钮的状态.
  bool hasOpenSwitch = false;
  bool hasCheckboxSelect = false;
  bool hasSendSelect = false;
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
          "1.关于文本及样式",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getTextWidgets(),
        Text(
          "2.关于按钮",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getButtonWidgets(),
        Text(
          "3.关于图片",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getImageWidgets(),
        Text(
          "3.关于开关和复选框",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getCheboxWidgets(),
        Text(
          "4.关于输入框(TextFiled)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getTextFiledWidgets(),
        Text(
          "5.进度指示器(Progress)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        getProgressWidgets(),
      ],
    );
  }

  //获取进度指示器
  Widget getProgressWidgets(){
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0
          ),
        ]
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("LinearProgressIndicator"),
          //进度条显示50%
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          Text("CircularProgressIndicator"),
          //进度条显示50%，会显示一个半圆
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          Text("自定义渐变动画的进度条"),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OtherWidgetView(startColor: Colors.red,endColor: Colors.green,height: 2.0,durationTime: 3,animationProgress: (value){
                  print("当前的动画进度---"+"$value");
                },),
              ],
            ),
          ),
          Text("自动动画加载进度条"),
          Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  //获取输入框
  Widget getTextFiledWidgets() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.green, offset: Offset(2.0, 2.0), blurRadius: 3.0)
          ]),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("常规使用的输入框"),
          TextField(
            autofocus: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.search,
            obscureText:false,
            obscuringCharacter: "-",
            maxLines: 1,
            cursorColor: Colors.red,
            cursorWidth: 2.0,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: "labelText",
              labelStyle: TextStyle(color: Colors.red),
              helperText: "helperText",
              helperStyle: TextStyle(color: Colors.blue),
              helperMaxLines: 2,
              hintText: "hintText",
              hintStyle: TextStyle(color: Colors.grey),
//              hintMaxLines: 3,
//              errorText: "errorText",
//              errorStyle: TextStyle(color: Colors.green),
//              errorMaxLines: 4,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color:Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(5.0),),
              ),
//              //区分一下类型.未选中时使用灰色.选中时使用蓝色
//              enabledBorder: OutlineInputBorder(
//                borderSide: BorderSide(color: Colors.grey),
//                borderRadius: BorderRadius.all(Radius.circular(5.0)),
//              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          Text("进阶的输入框使用-搜索框"),
          AppBarView(
            backgroundColor: Colors.grey,
            placeholder: "网红打卡地 景点 酒店 美食",
            city: "上海",
            searchBarType: SearchBarType.search,
            inputBoxClick: () {
              print("跳转搜索");
//              Navigator.push(context, MaterialPageRoute(builder: (context){
//                return HomeSearchPage();
//              }));
            },
            leftButtonClick: () {
              print("城市/返回选择界面");
            },
            speakButtonClick: () {
              print("语音按钮");
            },
            righButtonClick: () {
              print("评论/搜索按钮");
            },
          ),
        ],
      ),
    );
  }

  //获取复选框widget
  Widget getCheboxWidgets() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 0.0),
            blurRadius: 4.0,
          )
        ],
      ),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            activeThumbImage: AssetImage("assets/images/insta_logo.png"),
            activeTrackColor: Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            dragStartBehavior: DragStartBehavior.start,
            value: this.hasOpenSwitch,
            activeColor: Colors.red,
            onChanged: (open) {
              setState(() {
                this.hasOpenSwitch = open;
              });
            },
          ),
          Checkbox(
            mouseCursor: MaterialStateMouseCursor.clickable,
            tristate: true,
            //是否有三种状态.即选中.未选中.中间状态
            value: this.hasCheckboxSelect,
            visualDensity: VisualDensity.comfortable,
            checkColor: Colors.white,
            focusColor: Colors.red,
            onChanged: (open) {
              setState(() {
                this.hasCheckboxSelect = open;
              });
            },
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  //获取图片widget
  Widget getImageWidgets() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2.0, 0.0),
              blurRadius: 4.0,
            )
          ]),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("本地assets加载图片"),
          Image.asset(
            "assets/images/insta_logo.png",
            height: 20,
            color: Colors.orange,
          ),
          Text("网络加载图片以及图片展示效果"),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      "BoxFit.fill",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "BoxFit.contain",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "BoxFit.cover",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      "BoxFit.fitWidth",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      "BoxFit.fitHeight",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      "BoxFit.scaleDown",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.none,
                    ),
                    Text(
                      "BoxFit.none",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100.0,
                      height: 60,
                      fit: BoxFit.scaleDown,
                      repeat: ImageRepeat.repeatX,
                    ),
                    Text(
                      "repeat属性",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text("图片缓存"),
          CachedNetworkImage(
            width: 100,
            height: 100,
            imageUrl:
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("自定义Icon图标"),
          Icon(
            MyIcons.book,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget getButtonWidgets() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2.0, 0.0),
              blurRadius: 4.0,
            )
          ]),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("RaisedButton"),
                ),
                flex: 2,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("FlatButton"),
                ),
                flex: 1,
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            children: <Widget>[
              OutlineButton(
                onPressed: () {},
                child: Text("OutlineButton"),
              ),
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    print("点击手机号码");
                  }),
              OutlineButton.icon(
                icon: Icon(
                  Icons.send,
                  color: hasSendSelect ? Colors.blue : Colors.black45,
                ),
                label: Text(
                  "发送",
                  style: TextStyle(
                    color: hasSendSelect ? Colors.blue : Colors.black45,
                  ),
                ),
                borderSide: BorderSide(
                  color: hasSendSelect ? Colors.blue : Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    hasSendSelect = !hasSendSelect;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                disabledTextColor: Colors.red,
                disabledColor: Colors.grey,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.light,
                //按钮主题.默认为浅色主题
                splashColor: Colors.grey,
                //水波纹颜色
                highlightElevation: 0,
                //按下时的阴影为0
                elevation: 0,
                //正常情况下的阴影
                disabledElevation: 0,
                child: Text(
                  "CustomBtn",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                onHighlightChanged: (hasHighlight) {
                  print("$hasHighlight");
                },
                textTheme: ButtonTextTheme.primary,
                padding: EdgeInsets.all(0),
                visualDensity: VisualDensity(horizontal: 2, vertical: 0),
                //宽高调整
                clipBehavior: Clip.hardEdge,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("A"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //文本相关文本
  Widget getTextWidgets() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 0.0), blurRadius: 4.0),
        ],
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Text(
              "Hello world",
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Text(
            "Hello world" * 15,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
          Text(
            "Hello world",
            textScaleFactor: 1.5,
            style: textStyle,
          ),
          Text(
            "关于TextStyle的使用",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.orange,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "Home:",
              style: textStyle,
            ),
            TextSpan(
              text: "http://flutterchina.club",
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  showBottomSheet(
                    context: context,
                    builder: (_) => Container(
                      width: double.infinity,
                      color: Colors.black12,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "提示",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              "是否跳转到该链接所在网页?" * 3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  textBaseline: TextBaseline.ideographic),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  child: Text('确认'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              RaisedButton(
                                  child: Text(
                                    '取消',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
            )
          ])),
        ],
      ),
    );
  }
}
