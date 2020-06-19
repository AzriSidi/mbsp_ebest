import 'package:form_bloc/form_bloc.dart';
import 'package:xml/xml.dart';

class FormFieldsNotis extends FormBloc<String, String> {
  FormFieldsNotis() {
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'notis_btk',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tkh_btk',
      ),
    );
    addFieldBloc(
        fieldBloc: BooleanFieldBloc(
      name: 'jns_sksyn1',
    ));
    addFieldBloc(
        fieldBloc: BooleanFieldBloc(
      name: 'jns_sksyn2',
    ));
     addFieldBloc(
        fieldBloc: BooleanFieldBloc(
      name: 'jns_sksyn3',
    ));
     addFieldBloc(
        fieldBloc: BooleanFieldBloc(
      name: 'jns_sksyn4',
    ));
     addFieldBloc(
        fieldBloc: BooleanFieldBloc(
      name: 'jns_sksyn5',
    ));
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tmph_btk1',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tmph_btk2',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tmph_btk3',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tmph_btk4',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tkh_tmt1',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tkh_tmt2',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tkh_tmt3',
      ),
    );
    addFieldBloc(
      fieldBloc: TextFieldBloc(
        name: 'tkh_tmt4',
      ),
    );
    addFieldBloc(
      fieldBloc: SelectFieldBloc(
        name: 'cara_notis',
        items: ['BINAAN TANPA KEBENARAN 1', 
                'PINDAAN & TAMBAHAN TANPA KEBENARAN', 
                'MERUNTUH & MEMBINA SEMULA TANPA KEBENARAN'],
      ),
    );
  }

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    String noNotis = state.fieldBlocFromPath('notis_btk').asTextFieldBloc.value;
    String tkhBtk = state.fieldBlocFromPath('tkh_btk').asTextFieldBloc.value;
    bool jnsSksyn1 = state.fieldBlocFromPath('jns_sksyn1').asBooleanFieldBloc.value;
    bool jnsSksyn2 = state.fieldBlocFromPath('jns_sksyn2').asBooleanFieldBloc.value;
    bool jnsSksyn3 = state.fieldBlocFromPath('jns_sksyn3').asBooleanFieldBloc.value;
    bool jnsSksyn4 = state.fieldBlocFromPath('jns_sksyn4').asBooleanFieldBloc.value;
    bool jnsSksyn5 = state.fieldBlocFromPath('jns_sksyn5').asBooleanFieldBloc.value;

    String jnssksyn1,jnssksyn2,jnssksyn3,jnssksyn4,jnssksyn5;

    if(jnsSksyn1==true){
      jnssksyn1 = 'Y';
    }else{
      jnssksyn1 = '';
    }if(jnsSksyn2==true){
      jnssksyn2 = 'Y';
    }else{
      jnssksyn2 = '';
    }if(jnsSksyn3==true){
      jnssksyn3 = 'Y';
    }else{
      jnssksyn3 = '';
    }if(jnsSksyn4==true){
      jnssksyn4 = 'Y';
    }else{      
      jnssksyn4 = '';
    }if(jnsSksyn5==true){
      jnssksyn5 = 'Y';
    }else{      
      jnssksyn5 = '';
    }

    String tmphBtk1 = state.fieldBlocFromPath('tmph_btk1').asTextFieldBloc.value;
    String tmphBtk2 = state.fieldBlocFromPath('tmph_btk2').asTextFieldBloc.value;
    String tmphBtk3 = state.fieldBlocFromPath('tmph_btk3').asTextFieldBloc.value;
    String tmphBtk4 = state.fieldBlocFromPath('tmph_btk4').asTextFieldBloc.value;
    String tkhTmt1 = state.fieldBlocFromPath('tkh_tmt1').asTextFieldBloc.value;
    String tkhTmt2 = state.fieldBlocFromPath('tkh_tmt2').asTextFieldBloc.value;
    String tkhTmt3 = state.fieldBlocFromPath('tkh_tmt3').asTextFieldBloc.value;
    String tkhTmt4 = state.fieldBlocFromPath('tkh_tmt4').asTextFieldBloc.value;
    String caraNotis = state.fieldBlocFromPath('cara_notis').asSelectFieldBloc<String>().value;

    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
      builder.element('notis', nest: () {
        builder.element('notis_btk', nest: noNotis);        
        builder.element('tkh_btk', nest: tkhBtk);
        builder.element('jns_sksyn1', nest: jnssksyn1);
        builder.element('jns_sksyn2', nest: jnssksyn2);
        builder.element('jns_sksyn3', nest: jnssksyn3);
        builder.element('jns_sksyn4', nest: jnssksyn4);
        builder.element('jns_sksyn5', nest: jnssksyn5);
        builder.element('tmph_btk1', nest: tmphBtk1);
        builder.element('tmph_btk2', nest: tmphBtk2);
        builder.element('tmph_btk3', nest: tmphBtk3);
        builder.element('tmph_btk4', nest: tmphBtk4);
        builder.element('tkh_tmt1', nest: tkhTmt1);
        builder.element('tkh_tmt2', nest: tkhTmt2);
        builder.element('tkh_tmt3', nest: tkhTmt3);
        builder.element('tkh_tmt4', nest: tkhTmt4);
        builder.element('cara_notis', nest: caraNotis);
      });

      final bookshelfXml = builder.build();

    if(noNotis.isNotEmpty){
      await Future<void>.delayed(Duration(seconds: 2));
      yield state.toSuccess(successResponse: 'Success', canSubmitAgain: true);
      print(bookshelfXml);
    }else{
      yield state.toFailure("No Notis kosong");
    }
  }
}