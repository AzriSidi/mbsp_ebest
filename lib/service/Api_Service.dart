import 'package:flutter/material.dart';
import '../model/semak.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import '../model/salah.dart';

class ApiService {
  final String text;

  ApiService(this.text);

  Future<List<Semak>> getTaxFromXML() async {
    String url = 'http://148.72.213.158:8080/MBSP-ebest/checkTapak/$text';
    debugPrint('getUrl: $url');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return parseContacts(response.body);
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  List<Semak> parseContacts(String responseBody) {
    var raw = xml.parse(responseBody);
    var elements = raw.findAllElements('item');

    return elements.map((element) {
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
    }).toList();
  }
}

class ApiServiceSalah {
  static String ip = '192.168.0.188';
  String urlSalah = 'http://' + ip + '/MBSP-ebest/jns_kslhn';
  String urlNtsSmpai = 'http://' + ip + '/MBSP-ebest/nts_smpai';
  String urlNotis = 'http://' + ip + '/MBSP-ebest/notis';

  Future<List<Salah>> getSalahFromXML() async {
    debugPrint('getUrl: $urlSalah');
    try {
      final response = await http.get(urlSalah);
      if (response.statusCode == 200) {
        return parseXml(response.body);
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Salah>> getNtsSmpaiFromXML() async {
    debugPrint('getUrl: $urlNtsSmpai');
    try {
      final response = await http.get(urlNtsSmpai);
      if (response.statusCode == 200) {
        return parseXml(response.body);
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  List<Salah> parseXml(String responseBody) {
    var raw = xml.parse(responseBody);
    var elements = raw.findAllElements('item');

    return elements.map((element) {
      return Salah(
        element.findAllElements('KOD').first.text,
        element.findElements('KETERANGAN').first.text,
      );
    }).toList();
  }

  Future<bool> postNotisXML(data) async {
    bool task = false;
    debugPrint('url: $urlNotis');
    try {
      http.post(urlNotis,
          body: data, // data is your normal json data as a string,
          headers: {
            'Content-type': 'application/xml',
          });
      task = true;
    } catch (e) {
      print(e);
    }
    return task;
  }
}