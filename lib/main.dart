import 'package:flutter/material.dart';
import 'package:flutterapp1/demo/listViewDemo.dart';
import 'package:flutterapp1/demo/BottomNavigationBarDemo.dart';
import 'package:flutterapp1/demo/BasicDemo.dart';
import 'package:flutterapp1/demo/NavigatorDemo.dart';
import 'package:flutterapp1/demo/formDemo.dart';

void main(List<String> args) => runApp(page());

class page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   backgroundColor: Colors.grey[100],
      //   // body: home()
      //   // body: navigatorDemo(),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => home(
            TabBarView(
              children: <Widget>[
                listViewDemo(),
                // Icon(Icons.local_cafe, size: 128.0, color: Colors.black12),
                // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
                BasicDemo(),
                Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
              ],
            ),
            TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_cafe)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            )),
        '/text': (context) => navigatorDemo()
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class home extends StatefulWidget {
  final Widget _bodyWidget;
  final Widget _appBarBottom;

  home(this._bodyWidget, this._appBarBottom);

  @override
  State<StatefulWidget> createState() {
    return homeBuilder(_bodyWidget, _appBarBottom);
  }
}

class homeBuilder extends State<home> {
  Widget _bodyWidget;
  Widget _appBarBottom;
  int _current = 0;

  homeBuilder(this._bodyWidget, this._appBarBottom);

  void _tap(int index) {

    if (index == 1) {
      setState(() {
        _current = index;
        _bodyWidget = formDemo();
        _appBarBottom = null;
      });
    }

    if (index == 0) {
      setState(() {
        _current = index;
        _bodyWidget = TabBarView(
          children: <Widget>[
            listViewDemo(),
            BasicDemo(),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        );
        _appBarBottom = TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.local_cafe)),
            Tab(icon: Icon(Icons.change_history)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('myApp'),
            elevation: 1,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'nav',
            //   onPressed: () => debugPrint('nav is pressed'),
            // ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'search',
                onPressed: () => debugPrint('search is pressed'),
              )
            ],
            bottom: _appBarBottom,
          ),
          body: _bodyWidget,
          // body: TabBarView(
          //   children: <Widget>[
          //     listViewDemo(),
          //     // Icon(Icons.local_cafe, size: 128.0, color: Colors.black12),
          //     // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
          //     BasicDemo(),
          //     Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          //   ],
          // ),
          // drawer: Container(
          //   color: Colors.white,
          //   padding: EdgeInsets.all(8.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('这是一个抽屉')
          //     ],
          //   ),
          // ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('wangminghao',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text('wmh_java@163.com',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://resources.ninghao.org/images/wanghao.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('Messages', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.message, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text('Settings', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.settings, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  title: Text('Favorite', textAlign: TextAlign.right),
                  trailing:
                      Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBarStateDemo(),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _current,
              onTap: _tap,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat), title: Text('chat')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), title: Text('history')),
              ]),
        ));
  }
}

class oneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'hello1',
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 48),
    ));
  }
}
