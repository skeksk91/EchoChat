import 'package:flutter/material.dart';

void main() => runApp(new Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
  int _page = 0;
  PageController _c;

  @override
  void initState(){
    _c =  new PageController(
      initialPage: _page,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        onTap: (index) {
          this._c.jumpToPage(index);
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.record_voice_over), title: new Text("메아리")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.chat_bubble), title: new Text("방")),
        ],

      ),
      body: new PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: <Widget>[
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.record_voice_over),
                new Text("Users")
              ],
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.chat_bubble),
                new Text("Alerts")
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}