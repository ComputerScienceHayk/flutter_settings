import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_page/src/EditProfile.dart';

import 'Languages.dart';
import 'Notifications.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

final _editButtonColor = Colors.red;
final _notificationsColor = Colors.green;
final _languageColor = Colors.greenAccent;


class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 85,
        padding: EdgeInsets.only(top: 200.0, bottom: 20.0, left: 20.0, right: 20.0),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: ButtonTheme(
                buttonColor: _editButtonColor,
                minWidth: 400.0,
                height: 50.0,
                child:  RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.edit),
                        Container(
                          padding: EdgeInsets.only(right: 200.0),
                          child: Text("Edit Profile"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: ButtonTheme(
                buttonColor: _notificationsColor,
                minWidth: 400.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.notifications_active),
                      Padding(
                        padding: EdgeInsets.only(right: 190.0),
                        child: Text("Notifications"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: ButtonTheme(
                buttonColor: _languageColor,
                minWidth: 400.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LanguageSwitcher()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.language),
                      Padding(
                        padding: EdgeInsets.only(right: 210),
                        child: Text("Language"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
