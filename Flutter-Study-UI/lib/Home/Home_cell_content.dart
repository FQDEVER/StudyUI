import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Home/Home_top_content.dart';

class HomeCellView extends StatefulWidget {
  @override
  _HomeCellViewState createState() => _HomeCellViewState();
}

class _HomeCellViewState extends State<HomeCellView> {
  bool hasFavorite = false;
  String commentsStr = "";
  TextEditingController controller;
//  FocusNode focusNode = FocusNode();
//  bool hasFocusNode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {
        print(controller.value.text);
      });
    });
//    focusNode.addListener(() {
//      setState(() {
////        hasFocusNode = focusNode.hasFocus;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            height: 140,
            child: HomeTopContentView(),
          );
        } else {
          //根据index获取详细的模型
          return _getHomeCell(context, index);
        }
      },
    );
  }

  _getHomeCell(BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, //告知其展示最小值
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  getNetworkImage(
                      "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400"),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "imthpk",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  print("点击更多");
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
//        Flexible(
//            child: Image.network(
//          "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400",
//          fit: BoxFit.fill,
//        )),
//        Flexible(child:  FadeInImage.assetNetwork(placeholder: "assets/images/insta_logo.png", image: "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400",fit: BoxFit.fill,)),
        CachedNetworkImage(
          imageUrl: "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400",
          placeholder: (context,url){
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black,strokeWidth: 4),
            );
          },
          errorWidget: (context,url,error){
            return Icon(Icons.error);
          },
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        hasFavorite ? Icons.favorite : Icons.favorite_border,
                        color: hasFavorite ? Colors.black : Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          hasFavorite = !hasFavorite;
                        });
                        print("点击喜欢,发送请求");
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print("点击评论,发送请求");
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: this.commentsStr.length > 0
                            ? Colors.red
                            : Colors.black,
                      ),
                      onPressed: this.commentsStr.length > 0 ? () {
                        print("点击发布,发送请求");
                      } : null),
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.account_balance,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    print("点击其他,发送请求");
                  }),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Text(
            "Liked by pawankumar, pk and 528,331 others",
            style: TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: getNetworkImage(
                "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=400",
              ),
            ),
            SizedBox(width: 8),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                child: TextField(
                  controller: controller,
//                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                    focusColor: Colors.black,
//                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 0.5)),
//                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.5)),
                    border: InputBorder.none,// UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  ),
                  onChanged: (str) {
                    setState(() {
                      this.commentsStr = str;
                    });
                  },
//                onSubmitted: (text){
//                  print("内容提交回车");
//                },
//                onEditingComplete: (){
//                  print("oneditingcomplete");
//                },
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color:Colors.grey[200],width: 1.0)),
                ),
              ),
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            "1 Day Ago",
            style: TextStyle(fontSize: 13, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

Widget getNetworkImage(String url) {
  return Container(
    height: 40.0,
    width: 40.0,
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      image:new DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
    ),
  );
}
