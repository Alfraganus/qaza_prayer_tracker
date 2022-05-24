import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaza_prayer_tracker/provider/counter_provider.dart';
void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) =>Counter(250))
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              getPrayer(PrayerName: 'Bondot ${context.watch<Counter>().count}',),
              getPrayer(PrayerName: 'Peshin',),
              getPrayer(PrayerName: 'Asr',),
              getPrayer(PrayerName: 'Shom',),
              getPrayer(PrayerName: 'Xufton',),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class getPrayer extends StatefulWidget {
  const getPrayer({Key? key, required this.PrayerName, this.PrayerId}) : super(key: key);
  @override
  final String PrayerName;
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
              context.read<Counter>().decrement();
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
              context.read<Counter>().increment();
            },
            child: Text('+'),
          )
        ],
      ),
    );
  }
}




