import 'package:flutter/material.dart';

class XCTabBarView extends StatefulWidget {
  @override
  _XCTabBarViewState createState() => _XCTabBarViewState();
}

class _XCTabBarViewState extends State<XCTabBarView>  with SingleTickerProviderStateMixin{
  TabController tabController;
  int _selectIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: choices.length, vsync: this);
    tabController.addListener(() {
      print(tabController.index);
      setState(() {
        _selectIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.black,
                tabs: choices.map(
                  (Choice choice) {
                    return Container(
//                      color: (choice.index == _selectIndex ? Colors.orange : Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            choice.icon,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8),
                          Text(
                            choice.title,
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList()),
            title: SizedBox(
              height: 35,
              child: Image.asset("assets/images/insta_logo.png"),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: choices.map((Choice choice) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: ChoiceCard(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon,this.index});

  final String title;
  final IconData icon;
  final int index;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: "CAR", icon: Icons.directions_car,index: 0),
  const Choice(title: "BICYCLE", icon: Icons.directions_bike,index: 1),
  const Choice(title: "BOAT", icon: Icons.directions_boat,index: 2),
  const Choice(title: "BUS", icon: Icons.directions_bus,index: 3),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(fontSize: 13, color: Colors.black);
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 128.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
