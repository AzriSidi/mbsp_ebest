import 'package:flutter/material.dart';
import 'package:mbsp_ebest/service/Api_Service.dart';
import '../nav-drawer.dart';
import '../model/semak.dart';
import 'package:async_loader/async_loader.dart';
import '../result_semak.dart';

class ResultSemakState extends State<ResultSemak> {
  final double fontSize = 15.0;
  static List<Semak> contacts;
  ApiService api;
  ScrollController _controller = new ScrollController();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  reload() {
      _asyncLoaderState.currentState.reloadState();
  }

  static const TIMEOUT = const Duration(seconds: 3);
  
  @override
  Widget build(BuildContext context) {    
    api = new ApiService(widget.getText);

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
      body: RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: updateList,
      child:ListView(
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
                    future: api.getTaxFromXML(),
                    builder: (context,data){                                  
                    contacts = data.data;
                    
                    if(data.hasData && contacts[0] != null){                   
                      return GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        childAspectRatio: 4.5,
                        physics: ScrollPhysics(),
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
                      future: api.getTaxFromXML(),
                      builder: (context,data){
                      contacts = data.data;
                    
                      if(data.hasData && contacts[0] != null){
                        return Column(
                          children: <Widget>[                       
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              childAspectRatio: 3.5,
                              physics: ScrollPhysics(),
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
                                ], 
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
      ),
    );
  }

  Future<void> updateList() async {
    print("pull refresh");
    return api.getTaxFromXML().then((_contacts) {
      setState(() => contacts = _contacts);
    });
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
      TIMEOUT, () => 'Tiada Data');//
  }
}