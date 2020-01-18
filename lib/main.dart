import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(locale: data.locale, path: 'assets')
        ],
        supportedLocales: [Locale('en', 'US'), Locale('si', 'SL')],
        locale: data.savedLocale,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).tr('title')),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(AppLocalizations.of(context).tr('content')),
              OutlineButton(
                onPressed: () {
                  setState(() {
                    data.changeLocale(Locale('si','SL'));
                  });
                },
                child: Text('Sinhala'),
              ),
              OutlineButton(
                onPressed: () {
                  setState(() {
                    data.changeLocale(Locale('en','US'));
                  });
                },
                child: Text('English'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
