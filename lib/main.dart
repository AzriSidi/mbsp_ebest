import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'view/MyHomePageState.dart';
import 'nav-drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(        
        drawer: NavDrawer(),
        appBar: AppBar(title: Text('Semakan')),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}