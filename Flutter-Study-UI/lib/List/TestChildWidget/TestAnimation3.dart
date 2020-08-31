import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class TestAnimationPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          leading: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: SizedBox(
            height: 35,
            child: Image.asset("assets/images/insta_logo.png"),
          ),
        ),
        body: TestAnimation3(),
      ),
    );
  }
}

class TestAnimation3 extends StatefulWidget {
  @override
  _TestAnimation3State createState() => _TestAnimation3State();
}

class _TestAnimation3State extends State<TestAnimation3>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(
      begin: 0,
      end: 300.0,
    ).animate(animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              setState(() {
                animationController.reset();
                animationController.forward();
              });
            },
            child: Text(
              "Start",
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ),
          GrowTransition(
            child: FlutterLogo(),
            animation: animation,
          ),
        ],
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, tempChild) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: tempChild,
            );
          },
          child: child),
    );
  }
}
