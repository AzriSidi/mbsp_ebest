import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../form_fields/FormFieldsTapak.dart';
import '../widgets/widgets.dart';
import 'package:form_bloc/form_bloc.dart';

class FormBlocTapak extends StatelessWidget{

  @override
  Widget build(BuildContext context) {    
    return BlocProvider<FormFieldsTapak>(
      create: (context) => FormFieldsTapak(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<FormFieldsTapak>(context);
          
          return FormBlocListener<FormFieldsTapak, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              Notifications.showSnackBarWithSuccess(
                context, state.successResponse);
            },
            onFailure: (context, state) {
              LoadingDialog.hide(context);
              Notifications.showSnackBarWithError(
                context, state.failureResponse
              );
            },
            child: BlocBuilder<FormFieldsTapak, FormBlocState>(
              builder: (context, state) {
                return ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextFieldBlocBuilder(
                      textFieldBloc: state.fieldBlocFromPath('date'),
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Penyiasatan (DDMMYYYY)',
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masa: Jam Lebih Kurang',
                        prefixIcon: Icon(Icons.timer),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100,
                          child:CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('pagi'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Pagi'),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child:CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('tengahari'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Tengahari'),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('petang'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Petang'),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          child: CheckboxFieldBlocBuilder(
                            booleanFieldBloc: state.fieldBlocFromPath('malam'),
                            body: Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Malam'),
                            ),
                          ),
                        ),
                      ]
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select1'),
                      decoration: InputDecoration(
                        labelText: 'Jenis Kesalahan',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No Premis',
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No Lot',
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Jalan',
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tempat',
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Bandar',
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
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select1'),
                      decoration: InputDecoration(
                        labelText: 'Mukim',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select1'),
                      decoration: InputDecoration(
                        labelText: 'Daerah',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select1'),
                      decoration: InputDecoration(
                        labelText: 'Parlimen',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    DropdownFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select1'),
                      decoration: InputDecoration(
                        labelText: 'Dun',
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, value) => value,
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Kordinat'),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFieldBlocBuilder( 
                            textFieldBloc: state.fieldBlocFromPath('time'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Latitud',
                              prefixIcon: Icon(Icons.my_location),
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
                            textFieldBloc: state.fieldBlocFromPath('time'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Longitud',
                              prefixIcon: Icon(Icons.my_location),
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
                    TextFieldBlocBuilder( 
                      textFieldBloc: state.fieldBlocFromPath('time'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama',
                        prefixIcon: Icon(Icons.person),
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
                    RadioButtonGroupFieldBlocBuilder<String>(
                      selectFieldBloc: state.fieldBlocFromPath('select2'),
                      decoration: InputDecoration(
                        labelText: 'Kategori Binaan',
                        prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                        border: OutlineInputBorder(),
                      ),
                      itemBuilder: (context, item) => item,
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
      )
    );
  }
}