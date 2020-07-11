import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../locale/app_localization.dart';

class LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
      ),
      body: LanguageChange(),
    );
  }
}


class LanguageChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  // This widget is the root of your application.
  AppLocalizationDelegate _localeOverrideDelegate =
  AppLocalizationDelegate(Locale('ru', 'RU'));
 // AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          _localeOverrideDelegate
        ], supportedLocales: [
          const Locale('ru', 'RU'),
          const Locale('en', 'US'),
          const Locale('arm', 'AM')
        ],
        home: Languages());
  }
}

class Languages extends StatefulWidget {
  @override
  _LanguagesState createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 200.0, left: 10.0, right: 10.0, bottom: 50.0),
        child: Column(
          children: <Widget>[
            Text(AppLocalization.of(context).changeLang,
              style: TextStyle(fontSize: 25.0,decoration: TextDecoration.none, color: Colors.green),textAlign: TextAlign.center,),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: ButtonTheme(
                buttonColor: Colors.red,
                minWidth: 400.0,
                height: 50.0,
                child:  RaisedButton(
                  onPressed: () {
                    setState(() {
                      AppLocalization.load(Locale('en', 'US'));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.flag),
                        Container(
                          padding: EdgeInsets.only(right: 200.0),
                          child: Text(AppLocalization.of(context).enLangButton),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: ButtonTheme(
                buttonColor: Colors.blue,
                minWidth: 400.0,
                height: 50.0,
                child:  RaisedButton(
                  onPressed: () {
                    setState(() {
                      AppLocalization.load(Locale('ru', 'RU'));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.flag),
                        Container(
                          padding: EdgeInsets.only(right: 200.0),
                          child: Text(AppLocalization.of(context).ruLangButton),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
//            Container(
//              margin: EdgeInsets.only(top: 20.0),
//              child: ButtonTheme(
//                buttonColor: Colors.orange,
//                minWidth: 400.0,
//                height: 50.0,
//                child:  RaisedButton(
//                  onPressed: () {
//                    setState(() {
//                      AppLocalization.load(Locale('arm', 'AM'));
//                    });
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20)
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Icon(Icons.flag),
//                        Container(
//                          padding: EdgeInsets.only(right: 200.0),
//                          child: Text(AppLocalization.of(context).armLangButton),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
