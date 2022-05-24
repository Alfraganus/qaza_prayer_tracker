class UserData {
  final String prayer_type;
  final String count;
  UserData(this.prayer_type, this.count);

  Map<String, dynamic> getDataMap() {
    return {
      "prayer_type": 'Peshin',
      "count": '3',

    };
  }
}