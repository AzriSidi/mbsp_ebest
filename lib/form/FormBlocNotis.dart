import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../form_fields/FormFieldsNotis.dart';
import '../widgets/widgets.dart';
import 'package:form_bloc/form_bloc.dart';

class FormBlocNotis extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormFieldsNotis>(
      create: (context) => FormFieldsNotis(),
      child: Builder(
        builder: (context) {          
          final formBloc = BlocProvider.of<FormFieldsNotis>(context);
    
          return FormBlocListener<FormFieldsNotis, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              Notifications.showSnackBarWithSuccess(
                context, state.successResponse
              );
            },
            onFailure: (context, state) {
              LoadingDialog.hide(context);
              Notifications.showSnackBarWithError(
                context, state.failureResponse
              );
            },
            child: BlocBuilder<FormFieldsNotis, FormBlocState>(
              builder: (context, state) {
                return ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Notis Binaan Tanpa Kebenaran'),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFieldBlocBuilder(
                            textFieldBloc: state.fieldBlocFromPath('notis_btk'),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'No Notis',
                              prefixIcon: Icon(Icons.confirmation_number),
                            ),
                            onSubmitted: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            /* errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            }, */
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('tkh_btk'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tarikh Notis',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                      ]
                    ),
                    CheckboxFieldBlocBuilder(
                      booleanFieldBloc: state.fieldBlocFromPath('jns_sksyn1'),
                      body: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Seksyen 72(1)(A)',
                          style: new TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('jns_sksyn2'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Seksyen 72(1)(B)',
                                style: new TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder(
                            textFieldBloc: state.fieldBlocFromPath('tmph_btk1'),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tempoh Notis',
                              prefixIcon: Icon(Icons.content_paste),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('tkh_tmt1'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tarikh Tamat',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('jns_sksyn3'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Seksyen 72(1)(C)',
                                style: new TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder(
                            textFieldBloc: state.fieldBlocFromPath('tmph_btk2'),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tempoh Notis',
                              prefixIcon: Icon(Icons.content_paste),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('tkh_tmt2'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tarikh Tamat',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('jns_sksyn4'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Seksyen 72(1)(D)',
                                style: new TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder(
                            textFieldBloc: state.fieldBlocFromPath('tmph_btk3'),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tempoh Notis',
                              prefixIcon: Icon(Icons.content_paste),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('tkh_tmt3'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tarikh Tamat',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 180,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('jns_sksyn5'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Seksyen 46',
                                style: new TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder(
                            textFieldBloc: state.fieldBlocFromPath('tmph_btk4'),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tempoh Notis',
                              prefixIcon: Icon(Icons.content_paste),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('tkh_tmt4'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Tarikh Tamat',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                            errorBuilder: (context, error) {
                              switch (error) {
                                case FieldBlocValidatorsErrors.requiredTextFieldBloc:
                                  return 'You must write amazing text.';
                                  break;
                                default:
                                  return 'This text is nor valid.';
                              }
                            },
                          ),
                        ),
                      ]
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('cara_notis'),
                      decoration: InputDecoration(
                        labelText: 'Cara Penyampaian Notis',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    FormButton(
                      text: 'SUBMIT',
                      onPressed: formBloc.submit,
                    ),
                    FormButton(
                      text: 'CLEAR',
                      onPressed: formBloc.clear,
                    ),
                  ],
                );
              }
            ),
          );
        }
      ),
    );
  }
}