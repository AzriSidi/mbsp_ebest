import 'package:flutter/material.dart';
import 'package:card_settings/card_settings.dart';
import 'model.dart';
import 'package:flutter/cupertino.dart';
import 'nav-drawer.dart';

class PonyExample extends StatefulWidget {
  @override
  _PonyExampleState createState() => _PonyExampleState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _PonyExampleState extends State<PonyExample> {
  final _ponyModel = PonyModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // control state only works if the field order never changes.
  // to support orientation changes, we assign a unique key to each field
  // if you only have one orientation, the _formKey is sufficient
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _typeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _hobbiesKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _permisKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nolotKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _jalanKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lokasiKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _bandarKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _mukimKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _daerahKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _parlimenKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dunKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _kordinatKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _namaKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _kategoriKey = GlobalKey<FormState>();

  bool _showMaterialonIOS = true;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Maklumat Penyiasatan"),
      ),
      body: Form(
        key: _formKey,
        child: (orientation == Orientation.portrait)
            ? _buildPortraitLayout()
            : _buildLandscapeLayout(),
      ),
    );
  }

  /* CARDSETTINGS FOR EACH LAYOUT */

  CardSettings _buildPortraitLayout() {
    return CardSettings.sectioned(
      showMaterialonIOS: _showMaterialonIOS,
      labelWidth: _ponyModel.labelWidth,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialonIOS: _showMaterialonIOS,
          header: CardSettingsHeader(
            label: _ponyModel.label,
            showMaterialonIOS: _showMaterialonIOS,
          ),
          children: <Widget>[
            buildCardSettingsTextName(),
            buildCardSettingsListPickerType(),
            buildCardSettingsMultiselect(),
            buildCardSettingsTextNopermis(),
            buildCardSettingsTextNolot(),
            buildCardSettingsTextJalan(),
            buildCardSettingsTextLokasi(),
            buildCardSettingsTextBandar(),
            buildCardSettingsTextMukim(),
            buildCardSettingsTextDaerah(),
            buildCardSettingsTextParlimen(),
            buildCardSettingsTextDun(),
            buildCardSettingsTextKordinat(),
            buildCardSettingsTextNama(),
            buildCardSettingsTextKategori()
          ],
        ),
      ],
    );
  }

  CardSettings _buildLandscapeLayout() {
    return CardSettings.sectioned(
      showMaterialonIOS: _showMaterialonIOS,
      labelPadding: 12.0,
      labelWidth: _ponyModel.labelWidth,
      children: <CardSettingsSection>[
        CardSettingsSection(
          showMaterialonIOS: _showMaterialonIOS,
          header: CardSettingsHeader(
            label: _ponyModel.label,
            showMaterialonIOS: _showMaterialonIOS,
          ),
          children: <Widget>[
            buildCardSettingsTextName(),
            CardFieldLayout(
              <Widget>[
                buildCardSettingsListPickerType(),
              ],
              flexValues: [2, 1],
            ),
            buildCardSettingsMultiselect(),
            buildCardSettingsTextNopermis(),
            buildCardSettingsTextNolot(),
            buildCardSettingsTextJalan(),
            buildCardSettingsTextLokasi(),
            buildCardSettingsTextBandar(),
            buildCardSettingsTextMukim(),
            buildCardSettingsTextDaerah(),
            buildCardSettingsTextParlimen(),
            buildCardSettingsTextDun(),
            buildCardSettingsTextKordinat(),
            buildCardSettingsTextNama(),
            buildCardSettingsTextKategori()
          ],
        ),
      ],
    );
  }

  CardSettingsText buildCardSettingsMultiselect() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _hobbiesKey,
      label: 'Jenis Kesalahan',
      initialValue: 'Binaan Tanpa Kebenaran',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsListPickerType() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _typeKey,
      label: 'Masa',
      initialValue: '9.00 pagi',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextNopermis() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _permisKey,
      label: 'No Premis',
      initialValue: '1',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextName() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _nameKey,
      label: 'Tarikh',
      initialValue: '05/03/2020',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextNolot() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _nolotKey,
      label: 'No Lot',
      initialValue: '2',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextJalan() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _jalanKey,
      label: 'Jalan',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextLokasi() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _lokasiKey,
      label: 'Lokasi',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextBandar() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _bandarKey,
      label: 'Bandar',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextMukim() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _mukimKey,
      label: 'Mukim',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextDaerah() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _daerahKey,
      label: 'Daerah',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextParlimen() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _parlimenKey,
      label: 'Parlimen',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextDun() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _dunKey,
      label: 'Dun',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextKordinat() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _kordinatKey,
      label: 'Kordinat',
      initialValue: 'Latititud: \nLongitud: ',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextNama() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _namaKey,
      label: 'Nama Pemilik',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  CardSettingsText buildCardSettingsTextKategori() {
    return CardSettingsText(
      showMaterialonIOS: _showMaterialonIOS,
      key: _kategoriKey,
      label: 'Kategori Binaan',
      initialValue: '',
      focusNode: AlwaysDisabledFocusNode(),
    );
  }
}