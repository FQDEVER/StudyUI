import 'package:flutter/material.dart';

class HomeTopContentView extends StatefulWidget {
  @override
  _HomeTopContentViewState createState() => _HomeTopContentViewState();
}

class _HomeTopContentViewState extends State<HomeTopContentView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Stories",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              MaterialButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    Text(
                      "Watch All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          ),
          stories,
        ],
      ),
    );
  }
}

final stories = Expanded(
  child: new Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 15,
      itemBuilder: (context, index) => new Stack(
        children: <Widget>[
          new Container(
            width: 60.0,
            height: 60.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400"),
              ),
            ),
            margin: EdgeInsets.only(left: 8),
          ),
          index == 0
              ? Positioned(
                  right: 0,
                  child: new CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10.0,
                    child: new Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ))
              : new Text(""),
        ],
      ),
    ),
  ),
);
