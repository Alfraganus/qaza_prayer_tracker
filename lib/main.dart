import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaza_prayer_tracker/provider/counter_provider.dart';
import 'firebase/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDxKKYaaaQunICA_pZg_Ew_XfTOsQW1jrU',
      appId: '1:24199581709:android:5f229a990eb571ae884544',
      messagingSenderId: '24199581709',
      projectId: 'qaza-prayers-tracker',
      storageBucket: 'qaza-prayers-tracker.appspot.com',
    ),
  );
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) =>Counter())
    ],child: MyApp(),),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Wrap(
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 20,
            children: <Widget>[
              getPrayer(PrayerName: 'bondot ${context.watch<Counter>().Bondotcount}',PrayerType:'bondot' ,),
              getPrayer(PrayerName: 'peshin ${context.watch<Counter>().peshinCount}',PrayerType:'peshin'),
              getPrayer(PrayerName: 'asr ${context.watch<Counter>().asrCount}',PrayerType:'asr'),
              getPrayer(PrayerName: 'shom ${context.watch<Counter>().shomCount}',PrayerType:'shom'),
              getPrayer(PrayerName: 'xufton ${context.watch<Counter>().xuftonCount}',PrayerType:'xufton'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          final city = <String, String>{
            "prayerType": "Bondot",
            "times": "1",
            "user_id": "1",
          };
        db.collection("PrayerCounts").add(city).then((DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class getPrayer extends StatefulWidget {
  const getPrayer({Key? key, required this.PrayerName, this.PrayerId, required this.PrayerType}) : super(key: key);
  @override
  final String PrayerName;
  final String PrayerType;
  final int? PrayerId;
  State<getPrayer> createState() => _getPrayerState();
}

class _getPrayerState extends State<getPrayer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          RaisedButton(
            color: Colors.red, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              context.read<Counter>().decrement(widget.PrayerType);
            },
            child: Text('-'),
          ),
          SizedBox(width: 20,),
          Text(widget.PrayerName),
          SizedBox(width: 20,),
          RaisedButton(
            color: Colors.red, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              // print(widget.PrayerType);
              context.read<Counter>().increment(widget.PrayerType);
            },
            child: Text('+'),
          )
        ],
      ),
    );
  }
}




