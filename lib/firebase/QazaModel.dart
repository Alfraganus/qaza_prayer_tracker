class UserData {
  final String prayer_type;
  final String times;
  UserData(this.prayer_type, this.times);


  Map<String,dynamic> createMap(){
    return {
      'prayer_type': prayer_type,
      'times': times,
    };
  }

  UserData.fromFirestore(Map<String,dynamic> firestoreMap):
        prayer_type = firestoreMap['prayer_type'],
        times = firestoreMap['times'];

}
