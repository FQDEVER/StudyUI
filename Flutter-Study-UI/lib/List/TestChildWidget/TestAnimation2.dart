import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Home/Instagram_home.dart';
import 'package:flutter_insta_clone/List/TestChildWidget/TestAnimation1.dart';
import 'package:flutter/animation.dart';

class TestAnimationPage2 extends StatelessWidget {
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
          leading: MaterialButton(onPressed: (){
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back_ios),),
        ),
        body: TestAnimation2(),
      ),
    );
  }
}

class TestAnimation2 extends StatefulWidget {
  @override
  _TestAnimation2State createState() => _TestAnimation2State();
}

class _TestAnimation2State extends State<TestAnimation2>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MaterialButton(onPressed: (){
            controller.reset();
            controller.forward();
          },
            child: Text("start",style: TextStyle(color: Colors.black,fontSize: 15),),
          ),
          AnimationLogo(animation: animation),
        ],
      ),
    );
  }
}


class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key,Animation<double> animation}):super(key : key,listenable:animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double>animation = listenable;
    return Center(
      child: Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    ) ;
  }
}
