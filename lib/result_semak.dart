import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
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
  static List<Semak> contacts;
  ScrollController _controller = new ScrollController();

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
          element.findElements('BINAAN_JENIS').first.text,          
          element.findElements('NOTIS_BTK').first.text,
          element.findElements('TKH_BTK').first.text,
          element.findElements('JENIS_SEKSYEN1').first.text,
          element.findElements('JENIS_SEKSYEN2').first.text,
          element.findElements('JENIS_SEKSYEN3').first.text,
          element.findElements('JENIS_SEKSYEN4').first.text,
          element.findElements('JENIS_SEKSYEN5').first.text,
          element.findElements('TEMPOH_BTK1').first.text,
          element.findElements('TEMPOH_BTK2').first.text,
          element.findElements('TEMPOH_BTK3').first.text,
          element.findElements('TEMPOH_BTK4').first.text,
          element.findElements('TKH_TAMAT1').first.text,
          element.findElements('TKH_TAMAT2').first.text,
          element.findElements('TKH_TAMAT3').first.text,
          element.findElements('TKH_TAMAT4').first.text,
          element.findElements('NOTIS_SAMPAI').first.text,
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

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Hasil Semakan'),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        controller: _controller,
        children: <Widget>[
          SizedBox(height: 1.0),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 395,
            child:Card(
            elevation: 3.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    color: Colors.grey,                  
                    child: Column(
                      children: <Widget>[
                        getText("Maklumat Penyiasatan Tapak"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: FutureBuilder(
                    future: getTaxFromXML(context),
                    builder: (context,data){                                  
                    contacts = data.data;
                    
                    if(data.hasData && contacts[0] != null){                   
                      return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
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
                            subtitle: Text(contacts[0].jnsSalah, 
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
                            title: Text('No Lot', 
                              style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(contacts[0].noLot, 
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
                            subtitle: Text(contacts[0].binaanJns, 
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
              ],
            ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            height: 450,
            child:Card(
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      color: Colors.grey,                  
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          getText("Notis Binaan Tanpa Kebenaran"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                     child: FutureBuilder(
                      future: getTaxFromXML(context),
                      builder: (context,data){
                      contacts = data.data;
                    
                    if(data.hasData && contacts[0] != null){
                      return GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      childAspectRatio: 4.5,
                      children: <Widget>[ 
                        ListTile(
                          dense: true,
                          title: Text('No Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].notikBtk, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhBtk, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(),
                        ListTile(
                          dense: true,
                          title: Text('Seksyen 72(1)(A)', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jnsSksyn1, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(),
                        ListTile(),
                        ListTile(
                          dense: true,
                          title: Text('Seksyen 72(1)(B)', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jnsSksyn2, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tempoh Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tmphBtk1, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Tamat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhTamat1, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Seksyen 72(1)(C)', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jnsSksyn2, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tempoh Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tmphBtk2, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Tamat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhTamat2, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Seksyen 72(1)(D)', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jnsSksyn3, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tempoh Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tmphBtk3, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Tamat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhTamat3, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Seksyen 46', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].jnsSksyn4, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tempoh Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tmphBtk4, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Tarikh Tamat', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].tkhTamat4, 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text('Cara Notis', 
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle: Text(contacts[0].notisSampai, 
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getText(String text) {
    return Padding(
      padding: EdgeInsets.only(            
        top: 12,
      ),
      child: Text(text,
        style: TextStyle(fontSize: 20.0,),
      ),
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