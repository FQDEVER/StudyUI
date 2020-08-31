import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class OtherWidgetPage extends StatelessWidget {
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
        body: OtherWidgetView(), //ProgressRoute(),//
      ),
    );
  }
}

class OtherWidgetView extends StatefulWidget {

   Color startColor = Colors.orange;
   Color endColor = Colors.redAccent;
   int durationTime = 5;
   double height = 2.0;
   void Function(double) animationProgress;
  OtherWidgetView({this.startColor,this.endColor,this.height,this.durationTime,this.animationProgress});
  @override
  _OtherWidgetViewState createState() => _OtherWidgetViewState();
}

class _OtherWidgetViewState extends State<OtherWidgetView>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;
  double value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: widget.durationTime));
    animation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        value = controller.value;
        print(value);
        widget.animationProgress(value);
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
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OutlineButton(onPressed:(){
            setState(() {
              controller.reset();
              controller.forward();
            });
          },child: Text("重置"),
          ),
          Opacity(
            opacity: value == 1.0 ? 0 : 1.0,
            child: LinearProgressIndicator(
              minHeight: widget.height,
              valueColor: animation,
              backgroundColor: Colors.grey,
              value: controller.value,
            ),
          ),
        ],
      )
    );
  }
}
