import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
// import 'PonyExample.dart';
import 'package:xml/xml.dart' as xml;
import 'model.dart';
import 'nav-drawer.dart';
import 'semak.dart';
import 'package:http/http.dart' as http;
import 'package:async_loader/async_loader.dart';

class ResultSemak extends StatefulWidget {
  final String text;

  ResultSemak({Key key, this.text}) : super(key: key);

  @override
  _ResultSemakState createState() => _ResultSemakState();

  static const TIMEOUT = const Duration(seconds: 3);
}

class _ResultSemakState extends State<ResultSemak> {
  final double fontSize = 15.0;

  final _ponyModel = PonyModel();

  bool _showMaterialonIOS = true;

  static List<Semak> contacts;

  Future<List<Semak>> getTaxFromXML(BuildContext context) async{
    String url = 'http://148.72.213.158:8080/MBSP-ebest/checkTapak/'+widget.text;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseContacts(response.body); 
    } else {
      throw Exception('Unable to fetch products from the REST API');
    } 
  }

  List<Semak> parseContacts(String responseBody) {
    var raw = xml.parse(responseBody);
    var elements = raw.findAllElements('item');
        
    return elements.map((element){
      // if(element.findElements('mgs').first.text != 'No Data'){
        return Semak(
          element.findElements('TKH_SIASAT').first.text, 
          element.findElements('MASA_SIASAT').first.text,
          element.findElements('WAKTU_SIASAT').first.text,
          element.findElements('JENIS_SALAH').first.text,
          element.findElements('NO_PREMIS').first.text,
          element.findElements('NO_PREMIS').first.text,
          element.findElements('JALAN').first.text,
          element.findElements('LOKASI').first.text,
          element.findElements('BANDAR').first.text,
          element.findElements('MUKIM').first.text,
          element.findElements('DAERAH').first.text,
          element.findElements('PARLIMEN').first.text,
          element.findElements('DUN').first.text,
          element.findElements('KORDINAT1').first.text,
          element.findElements('KORDINAT2').first.text,
          element.findElements('NAMAPEMILIK').first.text,
          element.findElements('BINAAN_JENIS').first.text
        );
      /* }else{
        return null;
      } */
    }).toList();
  }

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  reload() {
      _asyncLoaderState.currentState.reloadState();
  }
  
  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
        key: _asyncLoaderState,
        initState: () async => getMessage(context),
        renderLoad: () => new CircularProgressIndicator(),
        renderError: ([error]) =>
            new Text('Sorry, there was an error loading'),
        renderSuccess: ({data}) => new Text(data),
      );

    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Maklumat Penyiasatan'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            height: 500,
            child:Card(
            elevation: 3.0,
            child: Center(
              child: FutureBuilder(
                future: getTaxFromXML(context),
                builder: (context,data){
                                
                 contacts = data.data;
                  
                  if(data.hasData && contacts[0] != null){                   
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 4.5,
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Siasat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhSiasat, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Masa Siasat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].masaSiasat, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Waktu Siasat',
                          style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].waktuSiasat, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Jenis Kesalahan', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jenisSalah, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('No Premis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].noPremis, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Jalan', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jalan, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Lokasi', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].lokasi, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Bandar', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].bandar, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Daerah', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].mukim, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Mukim', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].mukim, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Parlimen', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].parlimen, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Dun', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].dun, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Latitud', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].kordinat1, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Longitud', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].kordinat2, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Nama Pemilik', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].namaPemilik, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Binaan Jenis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].binaanJenis, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    );
                  }else{
                    return Scaffold(
                      body: new Center(
                        child: _asyncLoader,
                      ),
                    );
                  }
                }
              ),
            ),
            ),
          ),
          // SizedBox(height: 1.0),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 300,
            child: Form(
              child: (orientation == Orientation.portrait)
              ? _buildPortraitLayout()
              : _buildLandscapeLayout(),
            ),
          ),
        ],
      ),
    );
  }

  Color silver = HexColor("c4c4c4");
  CardSettings _buildPortraitLayout() {
    return CardSettings.sectioned(
      showMaterialonIOS: _showMaterialonIOS,
      labelWidth: _ponyModel.labelWidth,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialonIOS: _showMaterialonIOS,
          header: CardSettingsHeader(
            label: _ponyModel.label,
            // color: silver,
            showMaterialonIOS: _showMaterialonIOS,
          ),
          children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text(
                    'Tarikh Siasat', 
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    contacts[0].tkhSiasat, 
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
          ],
        ),
      ],
    );
  }

  CardSettings _buildLandscapeLayout() {
    return CardSettings.sectioned(
      showMaterialonIOS: _showMaterialonIOS,
      labelPadding: 12.0,
      labelWidth: _ponyModel.labelWidth,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialonIOS: _showMaterialonIOS,
          header: CardSettingsHeader(
            label: _ponyModel.label,
            showMaterialonIOS: _showMaterialonIOS,
          ),
          children: <Widget>[
            CardFieldLayout(
              <Widget>[
              ],
              flexValues: [2, 1],
            ),
          ],
        ),
      ],
    );
  }

  getMessage(BuildContext context) async {
    return new Future.delayed(
      ResultSemak.TIMEOUT, () => 'Tiada Data');//
  } 
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}