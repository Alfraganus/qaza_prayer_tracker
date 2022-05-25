import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qaza_prayer_tracker/firebase/QazaModel.dart';
import 'functions.dart';

class FireStoreService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveData(UserData userData) {
    return db
        .collection('PrayerCounts')
        .doc('0HdCx4MM4A0ymx6uzgg0')
        .set(userData.createMap());
  }

  Stream<List<UserData>> getPrayers() {
    return db.collection('PrayerCounts').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => UserData.fromFirestore(document.data()))
        .toList());
  }
}