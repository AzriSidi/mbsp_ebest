import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'nav-drawer.dart';
import 'package:mbsp_ebest/service/Api_Service.dart';

class CameraPicker extends StatefulWidget {
  @override
  _CameraPickerState createState() => _CameraPickerState();
}

class _CameraPickerState extends State<CameraPicker> {
  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  String _retrieveDataError;

  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  ApiServiceSalah apiSalah = new ApiServiceSalah();

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile = await _imagePicker.getImage(source: source);
      setState(() {
        _imageFile = pickedFile;
        print("filePath: " + _imageFile.path);
        if (source == ImageSource.camera) {
          apiSalah.uploadImg(_imageFile);
          GallerySaver.saveImage(_imageFile.path);
        }
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(_imageFile.path);
      } else {
        return Image.file(File(_imageFile.path));
      }
    } else if (_pickImageError != null) {
      return Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Open camera to caputure an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _imagePicker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
              ModalRoute.withName("/Home"));
        },
        child: Scaffold(
          drawer: NavDrawer(),
          appBar: AppBar(
            title: Text('Kamera'),
          ),
          body: Center(
            child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                ? FutureBuilder<void>(
                    future: retrieveLostData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const Text(
                            'Open camera to caputure an image.',
                            textAlign: TextAlign.center,
                          );
                        case ConnectionState.done:
                          return _previewImage();
                        default:
                          if (snapshot.hasError) {
                            return Text(
                              'Pick image/video error: ${snapshot.error}}',
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return const Text(
                              'Open camera to caputure an image.',
                              textAlign: TextAlign.center,
                            );
                          }
                      }
                    },
                  )
                : (_previewImage()),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  isVideo = false;
                  _onImageButtonPressed(ImageSource.gallery, context: context);
                },
                heroTag: 'image0',
                tooltip: 'Pick Image from gallery',
                child: const Icon(Icons.photo_library),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    isVideo = false;
                    _onImageButtonPressed(ImageSource.camera, context: context);
                  },
                  heroTag: 'image1',
                  tooltip: 'Take a Photo',
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ],
          ),
        ));
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);