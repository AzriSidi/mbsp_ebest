import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../form_fields/FormFieldsTapak.dart';
import '../widgets/widgets.dart';

class FormBlocTapak extends StatefulWidget {
  @override
  FormBlocTapakState createState() => FormBlocTapakState();
}

class FormBlocTapakState extends State<FormBlocTapak> {
  final FormFieldsTapak fft = new FormFieldsTapak();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateList() async {
    print("pull refresh");
    _refreshIndicatorKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      fft.locationManage();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormFieldsTapak>(
      create: (context) => FormFieldsTapak(),
      child: Builder(builder: (context) {
        final formBloc = context.bloc<FormFieldsTapak>();

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
                  context, state.failureResponse);
            },
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: updateList,
              child: Stack(children: <Widget>[
                SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            DateTimeFieldBlocBuilder(
                              dateTimeFieldBloc: formBloc.date,
                              format: DateFormat('dd-MM-yyyy'),
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Tarikh Penyiasatan (DD-MM-YYYY)',
                                prefixIcon: Icon(Icons.date_range),
                              ),
                            ),
                            TimeFieldBlocBuilder(
                              timeFieldBloc: formBloc.time,
                              format: DateFormat('hh:mm a'),
                              initialTime: TimeOfDay.now(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Masa: Jam Lebih Kurang',
                                prefixIcon: Icon(Icons.timer),
                              ),
                            ),
                            RadioButtonGroupFieldBlocBuilder(
                              selectFieldBloc: formBloc.duration,
                              decoration: InputDecoration(
                                labelText: 'Jangka Masa',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, item) => item,
                            ),
                            DropdownFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.jnsKslh,
                              decoration: InputDecoration(
                                labelText: 'Jenis Kesalahan',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, value) => value,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.noPremis,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'No Premis',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.noLot,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'No Lot',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.jalan,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Jalan',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.tempat,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Tempat',
                              ),
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.bandar,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Bandar',
                              ),
                            ),
                            DropdownFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.mukim,
                              decoration: InputDecoration(
                                labelText: 'Mukim',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, value) => value,
                            ),
                            DropdownFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.daerah,
                              decoration: InputDecoration(
                                labelText: 'Daerah',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, value) => value,
                            ),
                            DropdownFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.parlimen,
                              decoration: InputDecoration(
                                labelText: 'Parlimen',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, value) => value,
                            ),
                            DropdownFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.dun,
                              decoration: InputDecoration(
                                labelText: 'Dun',
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, value) => value,
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(3.0),
                              alignment: Alignment.centerLeft,
                              child: Text('Kordinat'),
                            ),
                            Row(children: <Widget>[
                              Expanded(
                                child: TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.lat,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Latitude',
                                    prefixIcon: Icon(Icons.my_location),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextFieldBlocBuilder(
                                  textFieldBloc: formBloc.long,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Longitude',
                                    prefixIcon: Icon(Icons.my_location),
                                  ),
                                ),
                              ),
                            ]),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.nama,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nama',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            RadioButtonGroupFieldBlocBuilder<String>(
                              selectFieldBloc: formBloc.binaan,
                              decoration: InputDecoration(
                                labelText: 'Kategori Binaan',
                                prefixIcon:
                                    Icon(Icons.sentiment_very_dissatisfied),
                                border: OutlineInputBorder(),
                              ),
                              itemBuilder: (context, item) => item,
                            ),
                            SizedBox(height: 40),
                          ],
                        ))),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 5,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: formBloc.clear,
                        child: Icon(Icons.clear),
                        backgroundColor: Colors.blueAccent.shade400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      height: 50,
                      child: FlatButton(
                        color: Colors.blueAccent.shade400,
                        onPressed: formBloc.submit,
                        child: Text(
                          'HANTAR',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ));
      }),
    );
  }
}