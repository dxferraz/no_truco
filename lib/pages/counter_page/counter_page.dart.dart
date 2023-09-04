import 'package:flutter/material.dart';
import 'package:no_truco/pages/counter_page/counter_functions.dart';
import '../../Components/menu/menu.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

CounterPage home = const CounterPage();

class CounterPageState extends State<CounterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      key: _scaffoldKey,
      drawer: const ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        child: Menu(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "NoTruco",
          style: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: 25,
            fontFamily: 'Conthrax',
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Left Side
            Column(
              children: [
                const Spacer(flex: 1),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/ClubsIcon.png',
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$aPoints',
                      style: TextStyle(
                        fontFamily: 'Conthrax',
                        color: Colors.grey.shade500,
                        fontSize: 70,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pts',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'A';
                        setState(() {
                          increment1Point(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        child: const Text(
                          "+1",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'A';
                        setState(() {
                          increment3Points(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        child: const Text(
                          "+3",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          team = 'A';
                          increment6Points(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        child: const Text(
                          "+6",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'A';
                        setState(() {
                          less1Point(team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 175, 127, 126),
                        ),
                        child: const Text(
                          "-1",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          confirmRestart(context);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(70),
                          ),
                          color: Color.fromARGB(255, 179, 179, 179),
                        ),
                        child: const Center(
                          child: Text(
                            "Recomeçar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 26, 26, 26),
                              fontSize: 14,
                              fontFamily: "Conthrax",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
              ],
            ),
            //Right Side
            Column(
              children: [
                const Spacer(flex: 1),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/HeartsIcon.png',
                      alignment: Alignment.center,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$bPoints',
                      style: TextStyle(
                        fontFamily: 'Conthrax',
                        color: Colors.grey.shade500,
                        fontSize: 70,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pts',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'B';
                        setState(() {
                          increment1Point(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        child: const Text(
                          "+1",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'B';
                        setState(() {
                          increment3Points(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 158, 158, 158),
                        ),
                        child: const Text(
                          "+3",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        team = 'B';
                        setState(() {
                          increment6Points(context, team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(
                            255,
                            158,
                            158,
                            158,
                          ),
                        ),
                        child: const Text(
                          "+6",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        team = 'B';
                        setState(() {
                          less1Point(team);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 175, 127, 126),
                        ),
                        child: const Text(
                          "-1",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 26, 26),
                            fontSize: 24,
                            fontFamily: "Conthrax",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          confirmFinish(context);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(70),
                          ),
                          color: Color.fromARGB(255, 179, 179, 179),
                        ),
                        child: const Center(
                          child: Text(
                            "Terminar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 26, 26, 26),
                              fontSize: 14,
                              fontFamily: "Conthrax",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
