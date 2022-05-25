import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class ActionPrayer {
  String type;
  int times;
  ActionPrayer({required this.type, required this.times});

void AddData() {
  final city = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
  };

  db.collection("PrayerCounts").add(city).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
}


}

