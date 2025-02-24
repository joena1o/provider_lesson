import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counterValue => _counter;

  void incrementCount() {
    _counter++;
    notifyListeners();
  }
}
