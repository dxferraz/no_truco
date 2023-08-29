// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'myhomepage.dart';

class ShowAWinner extends StatefulWidget {
  const ShowAWinner({Key? key}) : super(key: key);

  @override
  _ShowAWinnerState createState() => _ShowAWinnerState();
}

class _ShowAWinnerState extends State<ShowAWinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 150, right: 40, bottom: 150, left: 40),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "O Time",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 32,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'src/img/ClubsIcon.png',
                  width: 100,
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Venceu a partida",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 28,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            icon: Image.asset('src/img/RestartIcon.png')),
                        const Text(
                          "Reiniciar",
                          style: TextStyle(
                            fontFamily: 'CairoSBold',
                            fontSize: 15,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            icon: Image.asset('src/img/start.png')),
                        const Text(
                          "Continuar",
                          style: TextStyle(
                            fontFamily: 'CairoSBold',
                            fontSize: 15,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class ShowBWinner extends StatefulWidget {
  const ShowBWinner({Key? key}) : super(key: key);

  @override
  _ShowBWinnerState createState() => _ShowBWinnerState();
}

class _ShowBWinnerState extends State<ShowBWinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 150, right: 40, bottom: 150, left: 40),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "O Time",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 32,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'src/img/HeartsIcon.png',
                  width: 100,
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Venceu a partida",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 28,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            icon: Image.asset('src/img/RestartIcon.png')),
                        const Text(
                          "Reiniciar",
                          style: TextStyle(
                            fontFamily: 'CairoSBold',
                            fontSize: 15,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            icon: Image.asset('src/img/start.png')),
                        const Text(
                          "Continuar",
                          style: TextStyle(
                            fontFamily: 'CairoSBold',
                            fontSize: 15,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
