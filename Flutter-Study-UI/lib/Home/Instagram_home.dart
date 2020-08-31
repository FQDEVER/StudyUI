import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Home/Home_cell_content.dart';
import 'package:flutter_insta_clone/Home/Home_top_content.dart';

class InstagramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
              onPressed: null),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: null),
          ],
          brightness: Brightness.light,
          title: SizedBox(
            height: 35,
            child: Image.asset("assets/images/insta_logo.png"),
          ),
        ),
        body: InstagramContent(),
      ),
    );
  }
}

class InstagramContent extends StatefulWidget {
  @override
  _InstagramContentState createState() => _InstagramContentState();
}

class _InstagramContentState extends State<InstagramContent> {
  @override
  Widget build(BuildContext context) {
    //在这里实现需要展示的效果
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(child: HomeCellView()),
      ],
    );
  }
}
