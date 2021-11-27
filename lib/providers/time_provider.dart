import 'package:flutter/material.dart';

class Time with ChangeNotifier{
  

  String _seperator = ":";
  String get seperator => _seperator;

  String _timeout = "";
  String get timeout => _timeout;
  
  void time() {
    var x = DateTime.now();
    _timeout = "${x.hour.toString().padLeft(2,'0')}$seperator${x.minute.toString().padLeft(2,'0')}";
    notifyListeners();
  }

}