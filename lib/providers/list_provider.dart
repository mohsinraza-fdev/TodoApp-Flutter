import 'package:flutter/material.dart';

class listitems extends ChangeNotifier{
  List _tasklist = [];
  List get tasklist => _tasklist;

  void addtask(y) {
    if (y != '') {
      _tasklist.add('$y');
    }
    notifyListeners();
  }

  void reset() {
    _tasklist = [];

    notifyListeners();
  }

  void remove(i) {
    _tasklist.removeAt(i);

    notifyListeners();
  }
}