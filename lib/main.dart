import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdb_app/dependency_injection.dart';
import 'screens/home_screen.dart';

void main()  {

  //Environment to test data acccordingly
  //Comment below line to test mock environment
  Injector.configure(Flavor.PROD);


  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.deepPurple,scaffoldBackgroundColor: Colors.white10),
      home: HomeScreen(),
    );
  }
}
