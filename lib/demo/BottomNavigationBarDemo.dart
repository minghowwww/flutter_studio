import 'package:flutter/material.dart';
import 'package:flutterapp1/demo/formDemo.dart';
import 'package:flutterapp1/main.dart';
import 'package:flutterapp1/demo/listViewDemo.dart';
import 'package:flutterapp1/demo/BasicDemo.dart';

class BottomNavigationBarStateDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarStateBuilder();
  }
}

class BottomNavigationBarStateBuilder
    extends State<BottomNavigationBarStateDemo> {
  int _current = 0;

  void _tap(int index) {
    setState(() {
      _current = index;
    });

    if (_current == 1) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => home(formDemo(), null)));
      home(formDemo(), null).createState();
    }

    if (_current == 0) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => home(
      //             TabBarView(
      //               children: <Widget>[
      //                 listViewDemo(),
      //                 // Icon(Icons.local_cafe, size: 128.0, color: Colors.black12),
      //                 // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
      //                 BasicDemo(),
      //                 Icon(Icons.directions_bike,
      //                     size: 128.0, color: Colors.black12),
      //               ],
      //             ),
      //             TabBar(
      //               tabs: <Widget>[
      //                 Tab(icon: Icon(Icons.local_cafe)),
      //                 Tab(icon: Icon(Icons.change_history)),
      //                 Tab(icon: Icon(Icons.directions_bike)),
      //               ],
      //             ))));
      home(
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
          )).createState().initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _current,
        onTap: _tap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('chat')),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text('history')),
        ]);
  }
}
