import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    this.value,
    this.onChanged,
  });

  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ],
    );
  }
}


class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),backgroundColor: Color(0xffa01313),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(top: 50.0),
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Notifications"),
                    LinkedLabelSwitch(
                      value: _isSelected,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isSelected = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text("Lorem ispum ...", style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
        ),
      );
  }
}
