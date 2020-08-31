import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 3.3; //设置动画时长
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
        body: HeroAnimation(),
      ),
    );
  }
}

class HeroAnimation extends StatefulWidget {
  @override
  _HeroAnimationState createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: PhotoHero(
        tag: "PhotoChild",
        width: 300,
        child: FlutterLogo(size: 300,),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Scaffold(
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
              body: Container(
                alignment: Alignment.bottomLeft,
                child: PhotoHero(
                  tag: "PhotoChild",
                  width: 100,
                  child: FlutterLogo(size: 100,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  PhotoHero({this.tag, this.onTap, this.width, this.child});

  final String tag;
  final VoidCallback onTap;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: child,
            ),
          )),
    );
  }
}
