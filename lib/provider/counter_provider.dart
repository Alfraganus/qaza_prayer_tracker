import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  var cnt;

  Counter(this.cnt);


  int get count => cnt;


  void increment() {
    cnt++;
    notifyListeners();
  }
  void decrement() {
    cnt--;
    notifyListeners();
  }
}