import 'package:flutter/material.dart';
import 'nav-drawer.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'FormFieldsExampleFormBloc.dart';
import 'widgets/widgets.dart';
import 'package:form_bloc/form_bloc.dart';

class KesBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormFieldsExampleFormBloc>(
      create: (context) => FormFieldsExampleFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<FormFieldsExampleFormBloc>(context);

          return Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              title: Text('Kes Baru')
            ),
            body: FormBlocListener<FormFieldsExampleFormBloc, String, String>(
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
              child: BlocBuilder<FormFieldsExampleFormBloc, FormBlocState>(
                builder: (context, state) {
                  return ListView(
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      SizedBox(height: 10,),
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
                          prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                        ),
                        itemBuilder: (context, value) => value,
                      ),
                      CheckboxGroupFieldBlocBuilder<String>(
                        multiSelectFieldBloc:
                            state.fieldBlocFromPath('multiSelect'),
                        itemBuilder: (context, item) => item,
                        decoration: InputDecoration(
                          labelText: 'CheckboxGroupFieldBlocBuilder',
                          prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                        ),
                      ),
                      RadioButtonGroupFieldBlocBuilder<String>(
                        selectFieldBloc: state.fieldBlocFromPath('select2'),
                        decoration: InputDecoration(
                          labelText: 'RadioButtonGroupFieldBlocBuilder',
                          prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                        ),
                        itemBuilder: (context, item) => item,
                      ),
                      CheckboxFieldBlocBuilder(
                        booleanFieldBloc: state.fieldBlocFromPath('boolean1'),
                        // controlAffinity: FieldBlocBuilderControlAffinity.trailing,
                        body: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('CheckboxFieldBlocBuilder'),
                        ),
                      ),
                      SwitchFieldBlocBuilder(
                        booleanFieldBloc: state.fieldBlocFromPath('boolean2'),
                        // controlAffinity: FieldBlocBuilderControlAffinity.trailing,
                        body: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('CheckboxFieldBlocBuilder'),
                        ),
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
            ),
          );
        }
      )
    );
  }
}