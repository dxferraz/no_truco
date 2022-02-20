// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'menu.dart';
import 'myhomepage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: const Color(0xFF1A1A1A),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "NoTruco",
          style: TextStyle(fontSize: 20, fontFamily: 'Conthrax'),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 4),
            SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Olá!",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFFCCCCCC)),
                      ),
                    ],
                  ),
                  const Text(
                    "Seja bem vindo ao NoTruco",
                    style: TextStyle(fontSize: 26, color: Color(0xFFCCCCCC)),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "O contador de pontos mais fácil de usar!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xFFB3B3B3)),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      // ignore: prefer_const_constructors
                      duration: Duration(milliseconds: 500),
                      // ignore: prefer_const_constructors
                      child: HomePage(),
                    ),
                  ),
                  child: Image.asset(
                    'src/img/start.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Começar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Color(0xFFB3B3B3)),
                ),
              ],
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
