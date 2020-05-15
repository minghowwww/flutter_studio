import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class formDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[myForm()],
        ),
      ),
    );
  }
}

class myForm extends StatefulWidget {
  @override
  _myFormState createState() => _myFormState();
}

class _myFormState extends State<myForm> {
  DateTime today = DateTime.now();

  _showDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(3000));

    if (date == null) {
      return;
    }

    setState(() {
      today = date;
    });
  }

  _simpleDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Simple Dialog!'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('_alertDialog'),
                onPressed: () {
//                  Navigator.pop(context);
                  _alertDialog();
                },
              ),
              SimpleDialogOption(
                child: Text('bottomSheet'),
                onPressed: () {
//                  Navigator.pop(context);
                  _bottomSheet();
                },
              ),
              SimpleDialogOption(
                child: Text('optionC'),
                onPressed: () {
//                  Navigator.pop(context);
                  Scaffold.of(context).showSnackBar((
                    SnackBar(
                      content: Text('SnackBar'),
                    )
                  ));
                },
              ),
            ],
          );
        });
  }

  _alertDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog'),
        content: Text('AlertDialog'),
        actions: <Widget>[
          FlatButton(
            child: Text('cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  _bottomSheet() {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('option1'),
            ),
            ListTile(
              title: Text('option2'),
            ),
            ListTile(
              title: Text('option3'),
            ),
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: _showDate,
            child: Row(
              children: <Widget>[
                Text(DateFormat.yMd().format(today)),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'username'),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                '注册',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                debugPrint('注册');
                _simpleDialog();
              },
            ),
          )
        ],
      ),
    );
  }
}
