import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../form_fields/FormFieldsNotis.dart';
import '../widgets/widgets.dart';
import 'package:form_bloc/form_bloc.dart';

class FormBlocNotis extends StatefulWidget {
  FormBlocNotis({Key key}) : super(key: key);
  FormBlocNotisState createState() => FormBlocNotisState();
}

class FormBlocNotisState extends State<FormBlocNotis> {
  final FormFieldsNotis ffn = new FormFieldsNotis();

  @override
  void initState() {
    ffn.parseSalahFromXML();
    print("this is async");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormFieldsNotis(),
      child: Builder(builder: (context) {
        final formBloc = context.bloc<FormFieldsNotis>();

        return FormBlocListener<FormFieldsNotis, String, String>(
          onSubmitting: (context, state) => LoadingDialog.show(context),
          onSuccess: (context, state) {
            LoadingDialog.hide(context);
            Notifications.showSnackBarWithSuccess(
                context, state.successResponse);
          },
          onFailure: (context, state) {
            LoadingDialog.hide(context);
            Notifications.showSnackBarWithError(context, state.failureResponse);
          },
          child: BlocBuilder<FormFieldsNotis, FormBlocState>(
              builder: (context, state) {
            return ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Notis Binaan Tanpa Kebenaran'),
                ),
                Row(children: <Widget>[
                  TextFieldBlocBuilder(
                    textFieldBloc: formBloc.notisBtk,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No Notis',
                      prefixIcon: Icon(Icons.confirmation_number),
                    ),
                  ),
                  Expanded(
                    child: DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: formBloc.tkhBtk,
                      format: DateFormat('dd-mm-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Notis',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ]),
                CheckboxFieldBlocBuilder(
                  booleanFieldBloc: formBloc.jnsSksyn1,
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
                Row(children: <Widget>[
                  Container(
                    width: 180,
                    child: CheckboxFieldBlocBuilder(
                      booleanFieldBloc: formBloc.jnsSksyn2,
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
                      textFieldBloc: formBloc.tmphBtk1,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tempoh Notis',
                        prefixIcon: Icon(Icons.content_paste),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: formBloc.tkhTmt1,
                      format: DateFormat('dd-mm-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Tamat',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Container(
                    width: 180,
                    child: CheckboxFieldBlocBuilder(
                      booleanFieldBloc: formBloc.jnsSksyn3,
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
                      textFieldBloc: formBloc.tmphBtk2,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tempoh Notis',
                        prefixIcon: Icon(Icons.content_paste),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: formBloc.tkhTmt2,
                      format: DateFormat('dd-mm-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Tamat',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Container(
                    width: 180,
                    child: CheckboxFieldBlocBuilder(
                      booleanFieldBloc: formBloc.jnsSksyn4,
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
                      textFieldBloc: formBloc.tmphBtk3,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tempoh Notis',
                        prefixIcon: Icon(Icons.content_paste),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: formBloc.tkhTmt3,
                      format: DateFormat('dd-mm-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Tamat',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Container(
                    width: 180,
                    child: CheckboxFieldBlocBuilder(
                      booleanFieldBloc: formBloc.jnsSksyn5,
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
                      textFieldBloc: formBloc.tmphBtk4,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tempoh Notis',
                        prefixIcon: Icon(Icons.content_paste),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DateTimeFieldBlocBuilder(
                      dateTimeFieldBloc: formBloc.tkhTmt4,
                      format: DateFormat('dd-mm-yyyy'),
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarikh Tamat',
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                ]),
                DropdownFieldBlocBuilder<String>(
                  selectFieldBloc: formBloc.caraNotis,
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
          }),
        );
      }),
    );
  }
}