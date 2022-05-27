import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaza_prayer_tracker/firebase/firestore_service.dart';
import 'package:qaza_prayer_tracker/provider/counter_provider.dart';
import 'package:qaza_prayer_tracker/screens/product_list.dart';
import 'firebase/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
      ChangeNotifierProvider(create: (_) =>Counter()),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Data(),
    );
  }
}



class getPrayer extends StatefulWidget {
  const getPrayer({Key? key, required this.PrayerName, this.Prayercount, this.PrayerOrder}) : super(key: key);
  @override
  final String? PrayerName;
  final int? Prayercount;
  final int? PrayerOrder;
  State<getPrayer> createState() => _getPrayerState();
}

class _getPrayerState extends State<getPrayer> {

  @override
  Widget build(BuildContext context) {
  CollectionReference prayer = FirebaseFirestore.instance.collection('PrayerCounts');
  var numberofTimes = widget.Prayercount;
    return Container(
      child: Row(
        children: [
          RaisedButton(
            color: Colors.red, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              prayer.doc(findDocument(widget.PrayerOrder)).update( <String, dynamic>{
                "prayerType": widget.PrayerName,
                "order": widget.PrayerOrder,
                "times": numberofTimes! - 1,
                "user_id": 1,
              });

              // context.read<Counter>().decrement(widget.PrayerType);
            },
            child: Text('-'),
          ),
          SizedBox(width: 20,),
          Text(widget.PrayerName!+' '+widget.Prayercount.toString()),
          SizedBox(width: 20,),
          RaisedButton(
            color: Colors.red, // background
            textColor: Colors.white, // foreground
            onPressed: () {
              prayer.doc(findDocument(widget.PrayerOrder)).update( <String, dynamic>{
                "prayerType": widget.PrayerName,
                "order": widget.PrayerOrder,
                "times": numberofTimes! + 1,
                "user_id": 1,
              });
            },
            child: Text('+'),
          )
        ],
      ),
    );
  }
}

class Data extends StatelessWidget {
   Data({Key? key}) : super(key: key);
  final Stream<QuerySnapshot>prayers = FirebaseFirestore.instance.collection('PrayerCounts').orderBy('order').snapshots();

   static getPrayerData(prayerName,times,order) {
     <String, dynamic>{
       "prayerType": prayerName,
       "order": order,
       "times": times! + 1,
       "user_id": 1,
     };
   }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50,horizontal: 50),
      child: StreamBuilder<QuerySnapshot>(stream: prayers,builder:(
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot
          ){
        if(snapshot.hasError) {
          return Text('we have error');
        }
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }
        return snapshot.hasData  ? ListView.builder(
          itemCount: snapshot.requireData.size,
          itemBuilder: (context, index) {
            var name = snapshot.requireData.docs[index]['prayerType'];
            var count = snapshot.requireData.docs[index]['times'];
            var order = snapshot.requireData.docs[index]['order'];
           return   Padding(
             padding: EdgeInsets.only(top: 25),
             child: getPrayer(
                 PrayerName: name,
                 Prayercount: count,
                PrayerOrder: order,
             ),
           );
          },
        ) : Text('data is not avaible');
      }),
      //['prayerType']

    );
  }
}

 findDocument(order) {
   switch (order) {
     case 1 :
       return '0HdCx4MM4A0ymx6uzgg0';
     case 2 :
       return 'sxIXDxmGFYETY44kQwOd';
     case 3 :
       return '6OphRv3xxYjHAC8sEbOg';
     case 4 :
       return 'jelTOPDxyjfcYkh8jNcA';
     case 5 :
       return 'tih5MXDsaNAGXw6K0oYp';
   }
 }




