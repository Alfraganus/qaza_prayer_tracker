import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase/functions.dart';

class Counter with ChangeNotifier {
  var Bondotcount=0;
  var peshinCount=0;
  var asrCount=0;
  var shomCount=0;
  var xuftonCount=0;



  final docRef = db.collection("PrayerCounts").doc("JEEhH74B9g8kfBCRkdXu").get();
  dynamic data;


  void increment(String prayerType) {
    switch (prayerType) {
      case 'bondot' :
        {
          Bondotcount++;

          print(docRef);
         return notifyListeners();
        }

      case 'peshin' :
        {
          peshinCount++;
          return notifyListeners();  notifyListeners();
        }
      case 'asr' :
        {
          asrCount++;
          return notifyListeners();  notifyListeners();
        }
      case 'shom' :
        {
          shomCount++;
          return notifyListeners();  notifyListeners();
        }
      case 'xufton' :
        {
          xuftonCount++;
          return notifyListeners();  notifyListeners();
        }
    }
  }


  void decrement(String prayerType) {
    switch (prayerType) {
      case 'bondot' :
        {
          Bondotcount--;
          return notifyListeners();
        }

      case 'peshin' :
        {
          peshinCount--;
          return notifyListeners();  notifyListeners();
        }
      case 'asr' :
        {
          asrCount--;
          return notifyListeners();  notifyListeners();
        }
      case 'shom' :
        {
          shomCount--;
          return notifyListeners();  notifyListeners();
        }
      case 'xufton' :
        {
          xuftonCount--;
          return notifyListeners();  notifyListeners();
        }
    }
  }
}