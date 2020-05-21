import 'package:flutter/material.dart';
import 'nav-drawer.dart';

class KesBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Kes Baru"),
      ),
      body: Center(
        
      ),
    );
  }
}