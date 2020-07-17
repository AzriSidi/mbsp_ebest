import 'package:form_bloc/form_bloc.dart';
import 'package:mbsp_ebest/model/salah.dart';
import 'package:xml/xml.dart';
import 'package:mbsp_ebest/service/Api_Service.dart';

class FormFieldsNotis extends FormBloc<String, String> {
  ApiServiceSalah apiSalah = new ApiServiceSalah();
  List<Salah> salah = [];

  Stream parseSalahFromXML() async* {
    Future<List> _futureOfList = apiSalah.getSalahFromXML();
    salah = await _futureOfList;
    for (var i = 0; i < salah.length; i++) {
      yield salah[i].keter;
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
  final caraNotis = SelectFieldBloc(
    items: ['Option 1', 'Option 2'],
  );

  FormFieldsNotis() {
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
      jnsSksyn5
    ]);
  }

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    String noNotis = notisBtk.value;
    DateTime _tkhBtk = tkhBtk.value;
    bool _jnsSksyn1 = jnsSksyn1.value;
    bool _jnsSksyn2 = jnsSksyn2.value;
    bool _jnsSksyn3 = jnsSksyn3.value;
    bool _jnsSksyn4 = jnsSksyn4.value;
    bool _jnsSksyn5 = jnsSksyn5.value;

    String jnssksyn1, jnssksyn2, jnssksyn3, jnssksyn4, jnssksyn5;

    if (_jnsSksyn1 == true) {
      jnssksyn1 = 'Y';
    } else {
      jnssksyn1 = '';
    }
    if (_jnsSksyn2 == true) {
      jnssksyn2 = 'Y';
    } else {
      jnssksyn2 = '';
    }
    if (_jnsSksyn3 == true) {
      jnssksyn3 = 'Y';
    } else {
      jnssksyn3 = '';
    }
    if (_jnsSksyn4 == true) {
      jnssksyn4 = 'Y';
    } else {
      jnssksyn4 = '';
    }
    if (_jnsSksyn5 == true) {
      jnssksyn5 = 'Y';
    } else {
      jnssksyn5 = '';
    }

    String _tmphBtk1 = tmphBtk1.value;
    String _tmphBtk2 = tmphBtk2.value;
    String _tmphBtk3 = tmphBtk1.value;
    String _tmphBtk4 = tmphBtk1.value;

    DateTime _tkhTmt1 = tkhTmt1.value;
    DateTime _tkhTmt2 = tkhTmt2.value;
    DateTime _tkhTmt3 = tkhTmt3.value;
    DateTime _tkhTmt4 = tkhTmt4.value;

    String _caraNotis = caraNotis.value;

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('notis', nest: () {
      builder.element('notis_btk', nest: noNotis);
      builder.element('tkh_btk', nest: _tkhBtk);
      builder.element('jns_sksyn1', nest: jnssksyn1);
      builder.element('jns_sksyn2', nest: jnssksyn2);
      builder.element('jns_sksyn3', nest: jnssksyn3);
      builder.element('jns_sksyn4', nest: jnssksyn4);
      builder.element('jns_sksyn5', nest: jnssksyn5);
      builder.element('tmph_btk1', nest: _tmphBtk1);
      builder.element('tmph_btk2', nest: _tmphBtk2);
      builder.element('tmph_btk3', nest: _tmphBtk3);
      builder.element('tmph_btk4', nest: _tmphBtk4);
      builder.element('tkh_tmt1', nest: _tkhTmt1);
      builder.element('tkh_tmt2', nest: _tkhTmt2);
      builder.element('tkh_tmt3', nest: _tkhTmt3);
      builder.element('tkh_tmt4', nest: _tkhTmt4);
      builder.element('cara_notis', nest: _caraNotis);
    });

    final bookshelfXml = builder.build();

    if (noNotis.isNotEmpty) {
      await Future<void>.delayed(Duration(seconds: 2));
      yield state.toSuccess(successResponse: 'Success', canSubmitAgain: true);
      print(bookshelfXml);
    } else {
      yield state.toFailure(failureResponse: "No Notis kosong");
    }
  }
}