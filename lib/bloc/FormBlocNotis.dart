import 'package:flutter/cupertino.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:mbsp_ebest/form/FormNotis.dart';
import 'package:mbsp_ebest/model/salah.dart';
import 'package:xml/xml.dart';
import 'package:mbsp_ebest/service/Api_Service.dart';

//ignore_for_file: close_sinks
class FormBlocNotis extends FormBloc<String, String> {
  ApiServiceSalah apiSalah = new ApiServiceSalah();
  List<Salah> salah = [];
  static List<String> keter = [];
  static List<String> kod = [];
  static var concatenate = StringBuffer();
  static BuildContext context;

  Future<void> parseSalahFromXML() async {
    try {
      Future<List> _futureOfList = apiSalah.getSalahFromXML();
      salah = await _futureOfList;
      for (var i = 0; i < salah.length; i++) {
        keter.add(salah[i].keter);
      }
      concatenate.write(kod);
      print(concatenate.toString());
    } catch (e) {
      print(e);
    }
  }

  final notisBtk = TextFieldBloc();
  final tmphBtk1 = TextFieldBloc();
  final tmphBtk2 = TextFieldBloc();
  final tmphBtk3 = TextFieldBloc();
  final tmphBtk4 = TextFieldBloc();
  final tkhBtk = InputFieldBloc<DateTime, Object>();
  final tkhTmt1 = InputFieldBloc<DateTime, Object>();
  final tkhTmt2 = InputFieldBloc<DateTime, Object>();
  final tkhTmt3 = InputFieldBloc<DateTime, Object>();
  final tkhTmt4 = InputFieldBloc<DateTime, Object>();
  final jnsSksyn1 = BooleanFieldBloc();
  final jnsSksyn2 = BooleanFieldBloc();
  final jnsSksyn3 = BooleanFieldBloc();
  final jnsSksyn4 = BooleanFieldBloc();
  final jnsSksyn5 = BooleanFieldBloc();
  final caraNotis = SelectFieldBloc(items: keter);

  clearField() {
    notisBtk.clear();
    tkhBtk.clear();
    tkhTmt1.clear();
    tkhTmt2.clear();
    tkhTmt3.clear();
    tkhTmt4.clear();
    tmphBtk1.clear();
    tmphBtk2.clear();
    tmphBtk3.clear();
    tmphBtk4.clear();
    jnsSksyn1.clear();
    jnsSksyn2.clear();
    jnsSksyn3.clear();
    jnsSksyn4.clear();
    jnsSksyn5.clear();
    caraNotis.clear();
  }

  FormBlocNotis() {
    addFieldBlocs(fieldBlocs: [
      notisBtk,
      tkhBtk,
      tkhTmt1,
      tkhTmt2,
      tkhTmt3,
      tkhTmt4,
      tmphBtk1,
      tmphBtk2,
      tmphBtk3,
      tmphBtk4,
      jnsSksyn1,
      jnsSksyn2,
      jnsSksyn3,
      jnsSksyn4,
      jnsSksyn5,
      caraNotis
    ]);
  }

  @override
  void onSubmitting() async {
    String noNotis = notisBtk.value;
    bool _jnsSksyn1 = jnsSksyn1.value;
    bool _jnsSksyn2 = jnsSksyn2.value;
    bool _jnsSksyn3 = jnsSksyn3.value;
    bool _jnsSksyn4 = jnsSksyn4.value;
    bool _jnsSksyn5 = jnsSksyn5.value;

    String jnssksyn1, jnssksyn2, jnssksyn3, jnssksyn4, jnssksyn5;
    String strTkhBtk, strTkhTmt1, strTkhTmt2, strTkhTmt3, strTkhTmt4;

    if (_jnsSksyn1 == true) {
      jnssksyn1 = 'Y';
    }
    if (_jnsSksyn2 == true) {
      jnssksyn2 = 'Y';
    }
    if (_jnsSksyn3 == true) {
      jnssksyn3 = 'Y';
    }
    if (_jnsSksyn4 == true) {
      jnssksyn4 = 'Y';
    }
    if (_jnsSksyn5 == true) {
      jnssksyn5 = 'Y';
    }

    String _tmphBtk1 = tmphBtk1.value;
    String _tmphBtk2 = tmphBtk2.value;
    String _tmphBtk3 = tmphBtk3.value;
    String _tmphBtk4 = tmphBtk4.value;

    DateTime _tkhBtk = tkhBtk.value;
    DateTime _tkhTmt1 = tkhTmt1.value;
    DateTime _tkhTmt2 = tkhTmt2.value;
    DateTime _tkhTmt3 = tkhTmt3.value;
    DateTime _tkhTmt4 = tkhTmt4.value;

    if (_tkhBtk != null) {
      strTkhBtk = DateFormat('yyyy-MM-dd HH:mm:ss').format(_tkhBtk);
    }
    if (_tkhTmt1 != null) {
      strTkhTmt1 = DateFormat('yyyy-MM-dd HH:mm:ss').format(_tkhTmt1);
    }
    if (_tkhTmt2 != null) {
      strTkhTmt2 = DateFormat('yyyy-MM-dd HH:mm:ss').format(_tkhTmt2);
    }
    if (_tkhTmt3 != null) {
      strTkhTmt3 = DateFormat('yyyy-MM-dd HH:mm:ss').format(_tkhTmt3);
    }
    if (_tkhTmt4 != null) {
      strTkhTmt4 = DateFormat('yyyy-MM-dd HH:mm:ss').format(_tkhTmt4);
    }

    String _caraNotis = caraNotis.value;

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('notis', nest: () {
      builder.element('notis_btk', nest: noNotis);
      builder.element('tkh_btk', nest: strTkhBtk);
      builder.element('jns_sksyn1', nest: jnssksyn1);
      builder.element('jns_sksyn2', nest: jnssksyn2);
      builder.element('jns_sksyn3', nest: jnssksyn3);
      builder.element('jns_sksyn4', nest: jnssksyn4);
      builder.element('jns_sksyn5', nest: jnssksyn5);
      builder.element('tmph_btk1', nest: _tmphBtk1);
      builder.element('tmph_btk2', nest: _tmphBtk2);
      builder.element('tmph_btk3', nest: _tmphBtk3);
      builder.element('tmph_btk4', nest: _tmphBtk4);
      builder.element('tkh_tmt1', nest: strTkhTmt1);
      builder.element('tkh_tmt2', nest: strTkhTmt2);
      builder.element('tkh_tmt3', nest: strTkhTmt3);
      builder.element('tkh_tmt4', nest: strTkhTmt4);
      builder.element('cara_notis', nest: _caraNotis);
    });

    final bookshelfXml = builder.build();

    if (noNotis.isNotEmpty) {
      Future<bool> api = apiSalah.postNotisXML(bookshelfXml.toString());
      if (api != null) {
        await Future<void>.delayed(Duration(seconds: 2));
        emitSuccess(canSubmitAgain: true);
        clearField();
      }
      print(bookshelfXml);
    } else {
      emitFailure(failureResponse: "No Notis kosong");
    }
  }
}