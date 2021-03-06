import 'package:flutter/material.dart';
import 'view/ResultSemakState.dart';

class ResultSemak extends StatefulWidget {
  final String text;

  ResultSemak({Key key, this.text}) : super(key: key);

  String get getText => text;

  @override
  ResultSemakState createState() => ResultSemakState();
}