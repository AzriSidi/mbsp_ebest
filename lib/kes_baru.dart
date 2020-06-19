import 'package:flutter/material.dart';
import 'form/FormBlocNotis.dart';
import 'nav-drawer.dart';
import 'form/FormBlocTapak.dart';

class KesBaru extends StatelessWidget {
  final FormBlocTapak tapak = new FormBlocTapak();
  final FormBlocNotis notis = new FormBlocNotis();

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
            tabs: [
              Tab(text: 'Tapak'),
              Tab(text: 'Notis')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            tapak,notis
          ],
        ),
      ),
    );
  }
}