import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/DataTool/myIcons.dart';
import 'package:flutter_insta_clone/Home/Instagram_home.dart';
import 'package:flutter_insta_clone/Learning/Learning_list.dart';
import 'package:flutter_insta_clone/List/testwidget_lists.dart';
import 'package:flutter_insta_clone/ProjectContent/xc_content.dart';
import 'package:flutter_insta_clone/XCContentPage/xc_content_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _currentIndex = 0;
  final Color _normalColor = Colors.black;
  final Color _selectColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          InstagramPage(),
          TestListPage(),
          XCTabBarView(),
          XCContentPage(),
          LeariningListPage(),
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _normalColor,
            ),
            title: Text(
              "首页",
              style: TextStyle(
                  color: _currentIndex == 0 ? _selectColor : _normalColor,
                  fontSize: 13),
            ),
            activeIcon: Icon(
              Icons.home,
              color: _selectColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.book,
              color: _normalColor,
            ),
            title: Text(
              "搜索",
              style: TextStyle(
                  color: _currentIndex == 1 ? _selectColor : _normalColor,
                  fontSize: 13),
            ),
            activeIcon: Icon(
              MyIcons.book,
              color: _selectColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MyIcons.wechat,
              color: _normalColor,
            ),
            title: Text(
              "添加",
              style: TextStyle(
                  color: _currentIndex == 2 ? _selectColor : _normalColor,
                  fontSize: 13),
            ),
            activeIcon: Icon(
              MyIcons.wechat,
              color: _selectColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _normalColor,
            ),
            title: Text(
              "喜欢",
              style: TextStyle(
                  color: _currentIndex == 3 ? _selectColor : _normalColor,
                  fontSize: 13),
            ),
            activeIcon: Icon(
              Icons.favorite,
              color: _selectColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: _normalColor,
            ),
            title: Text(
              "学习",
              style: TextStyle(
                  color: _currentIndex == 4 ? _selectColor : _normalColor,
                  fontSize: 13),
            ),
            activeIcon: Icon(
              Icons.book,
              color: _selectColor,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
