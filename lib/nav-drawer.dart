import 'package:flutter/material.dart';
import 'kes_baru.dart';
import 'laporan.dart';
import 'main.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                /* image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg')) */),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Semakan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Kes Baru'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => KesBaru(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('Laporan & Statistik'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => Laporan(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Kamera'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Keluar'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}