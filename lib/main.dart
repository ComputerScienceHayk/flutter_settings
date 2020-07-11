import 'package:flutter/material.dart';
import 'package:settings_page/src/Settings.dart';

import 'Test.dart';

void main () => runApp(new SettingsApp());

class SettingsApp extends StatefulWidget {
  @override
  _SettingsAppState createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Settings(),
    );
  }
}


