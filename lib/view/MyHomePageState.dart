import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';
import '../result_semak.dart';

class MyHomePageState extends State<MyHomePage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResultSemak(text:_controller.text),
                        ),
                      );
                    },
                    child: Text('Cari'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      onPressed: () {
                        _controller.clear();
                      },
                    child: Text('Semula'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}