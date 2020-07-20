import 'package:flutter/material.dart';
import 'form/FormNotis.dart';
import 'nav-drawer.dart';
import 'form/FormTapak.dart';

class KesBaru extends StatelessWidget {
  final FormTapak tapak = new FormTapak();
  final FormNotis notis = new FormNotis();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Kes Baru'),
          bottom: TabBar(
            tabs: [Tab(text: 'Tapak'), Tab(text: 'Notis')],
          ),
        ),
        body: TabBarView(
          children: <Widget>[tapak, notis],
        ),
      ),
    );
  }
}