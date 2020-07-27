import 'package:flutter/material.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:location/location.dart';
import 'package:mbsp_ebest/model/salah.dart';
import 'package:mbsp_ebest/service/Api_Service.dart';

//ignore_for_file: close_sinks
class FormBlocTapak extends FormBloc<String, String> {
  static String lati, longi;
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  ApiServiceSalah apiSalah = new ApiServiceSalah();
  List<Salah> salah = [];
  static List<String> keter = [];
  static List<String> kod = [];

  Future<LocationData> locationManage() async {
    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
      }

      location.onLocationChanged.listen((LocationData currentLocation) {
        // Use current location
        lati = currentLocation.latitude.toString();
        longi = currentLocation.longitude.toString();
        // print("Location: " + lati + " , " + longi);
      });
    } catch (e) {
      print("errorLocation: " + e.toString());
    }
    return _locationData;
  }

  Future<void> parseSalahFromXML() async {
    try {
      Future<List> _futureOfList = apiSalah.getSalahFromXML();
      salah = await _futureOfList;
      for (var i = 0; i < salah.length; i++) {
        keter.add(salah[i].keter);
      }
    } catch (e) {
      print(e);
    }
  }

  final date = InputFieldBloc<DateTime, Object>();
  final time = InputFieldBloc<TimeOfDay, Object>();
  final pagi = BooleanFieldBloc();
  final tengahari = BooleanFieldBloc();
  final petang = BooleanFieldBloc();
  final malam = BooleanFieldBloc();
  final noPremis = TextFieldBloc();
  final noLot = TextFieldBloc();
  final jalan = TextFieldBloc();
  final tempat = TextFieldBloc();
  final bandar = TextFieldBloc();

  final lat = TextFieldBloc(
    initialValue: lati,
  );
  final long = TextFieldBloc(
    initialValue: longi,
  );

  final nama = TextFieldBloc();
  final jnsKslh = SelectFieldBloc(
    items: keter,
  );
  final mukim = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );
  final daerah = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );
  final parlimen = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );
  final dun = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );
  final duration = SelectFieldBloc(
    name: 'duration',
    items: ['Pagi', 'Tengahari', 'Petang', 'Malam'],
  );
  final binaan = SelectFieldBloc(
    items: ['Binaan Baru', 'Tambahan'],
  );

  FormBlocTapak() {
    addFieldBlocs(fieldBlocs: [
      date,
      time,
      pagi,
      tengahari,
      petang,
      malam,
      noPremis,
      noLot,
      jalan,
      tempat,
      bandar,
      lat,
      long,
      nama,
      jnsKslh,
      duration,
      binaan,
      mukim,
      daerah,
      parlimen,
      dun
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      print(date.value);
      print(time.value);
      print(duration.value);
      print(tengahari.value);
      print(petang.value);
      print(malam.value);
      print(noPremis.value);
      print(noLot.value);
      print(jalan.value);
      print(tempat.value);
      print(bandar.value);
      print(lat.value);
      print(long.value);
      print(nama.value);
      print(jnsKslh.value);
      print(binaan.value);
      print(mukim.value);
      print(daerah.value);
      print(parlimen.value);
      print(dun.value);

      await Future<void>.delayed(Duration(milliseconds: 500));
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}