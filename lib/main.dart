import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'nav-drawer.dart';
import 'result_semak.dart';

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  
  @override
  void dispose() {
    // other dispose methods
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
                child:Container(
                  width: 150.0,
                  child: TextField(
                    autofocus: true,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'No Kes',
                      suffixIcon: IconButton(
                        onPressed: () => _controller.clear(),
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultSemak(text:_controller.text),
                      ),
                    );
                  },
                child: Text('Semak'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}