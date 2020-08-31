import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;

/*
* Hero createRectTween的运用还需再了解
* */

class HeroAnimationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; //设置动画时长
    return NavigationBar(body: HeroAnimation2());
  }
}

class NavigationBar extends StatelessWidget {
  NavigationBar({@required this.body});
  final Widget body;
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
        body: body,
      ),
    );
  }
}

class HeroAnimation2 extends StatefulWidget {
  @override
  _HeroAnimation2State createState() => _HeroAnimation2State();
}

class _HeroAnimation2State extends State<HeroAnimation2> {
  static const double kMinRadius = 50;
  static const double kMaxRadius = 150;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
          tag: "tag",
          createRectTween: _createRectTween,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: PhotoHero(
              child: FlutterLogo(
                size: kMinRadius * 2.0,
              ),
              backgroundColor: Colors.orange,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: NavigationBar(body: _showDetailPage(context)),
                  );
                }));
              },
            ),
          )),
    );
  }

  Widget _showDetailPage(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                    tag: "tag",
                    createRectTween: _createRectTween,
                    child: RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: PhotoHero(
                        backgroundColor: Colors.lightBlueAccent,
                        child: FlutterLogo(
                          size: kMaxRadius * 2.0,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
              ),
              Text(
                "测试",
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  PhotoHero(
      {this.tag, this.onTap, this.width, this.child, this.backgroundColor});

  final String tag;
  final VoidCallback onTap;
  final double width;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: backgroundColor,
            child: InkWell(
              onTap: onTap,
              child: child,
            ),
          ),
        ));
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
