import 'package:flutter/material.dart';
import 'nav-drawer.dart';

class Laporan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Laporan & Statistik"),
      ),
      body: Center(
        
      ),
    );
  }
}