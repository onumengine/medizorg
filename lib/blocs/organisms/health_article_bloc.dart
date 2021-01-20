import 'package:flutter/material.dart';

class HealthArticleBloc extends ChangeNotifier {
  String _date = '01 Jan 2021';
  String get date => _date;
  set date(String value) {
    _date = value;
    notifyListeners();
  }

  String _title = 'COVID-19 Vaccine';
  String get title => _title;
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String _body =
      'Official Public Service Announcement on the Coronavirus by the WHO';
  String get body => _body;
  set body(String value) {
    _body = value;
    notifyListeners();
  }
}
