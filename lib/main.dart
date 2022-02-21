import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'initialPage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoTruco',
      theme: ThemeData(
        fontFamily: 'CairoSBold',
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const InitialPage(),
    );
  }
}
