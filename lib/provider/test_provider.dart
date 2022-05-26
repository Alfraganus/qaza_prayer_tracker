import 'package:flutter/foundation.dart';
import 'package:flutter_responsiveness/models/product.dart';
import 'package:qaza_prayer_tracker/firebase/QazaModel.dart';
import '../firebase/firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final service = FireStoreService();
  String? _times;
  String? _prayer_type;
  var uuid = Uuid();

//Getters:

  String get getName => _name;
  double get getPrice => _price;

//Setters:

  void changePrayerTime(String val) {
    _prayer_type = val;
    notifyListeners();
  }

  loadValues(UserData userData) {
    _prayer_type = userData.prayer_type;
    _times = userData.times;
  }

  void saveData() {
    var updatedProduct =
    UserData();
    service.saveProduct(updatedProduct);
  }

}