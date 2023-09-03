import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../Components/popups/show_winner.dart';
import '../../Components/menu/menu.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

CounterPage home = const CounterPage();

class CounterPageState extends State<CounterPage> {
  int aPoints = 0;
  int bPoints = 0;
  //Add points to A Team
  void increment1APoint() {
    setState(() => aPoints++);
    verify();
  }

  void increment3APoints() {
    setState(() => aPoints = aPoints + 3);
    verify();
  }

  void increment6APoints() {
    setState(() => aPoints = aPoints + 6);
    verify();
  }

  void less1APoint() {
    setState(
      () {
        if (aPoints > 0) {
          aPoints = aPoints - 1;
        } else {}
      },
    );
  }

  //Add points to B Team
  void increment1BPoint() {
    setState(() => bPoints++);
    verify();
  }

  void increment3BPoints() {
    setState(() => bPoints = bPoints + 3);
    verify();
  }

  void increment6BPoints() {
    setState(() => bPoints = bPoints + 6);
    verify();
  }

  void less1BPoint() {
    setState(
      () {
        if (bPoints > 0) {
          bPoints = bPoints - 1;
        } else {}
      },
    );
  }

  //Restart points
  void restart() {
    setState(
      () {
        aPoints = aPoints = 0;
        bPoints = bPoints = 0;
      },
    );
  }

  //Verify winner
  void verify() {
    if (aPoints >= 12) {
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.scale,
          duration: const Duration(seconds: 1),
          alignment: Alignment.center,
          child: const ShowAWinner(),
        ),
      );
      setState(
        () {
          aPoints = aPoints = 0;
          bPoints = bPoints = 0;
        },
      );
    }
    if (bPoints >= 12) {
      Navigator.of(context).push(
        PageTransition(
          type: PageTransitionType.scale,
          duration: const Duration(seconds: 1),
          alignment: Alignment.center,
          child: const ShowBWinner(),
        ),
      );
      setState(
        () {
          aPoints = aPoints = 0;
          bPoints = bPoints = 0;
        },
      );
    }
  }

  //Confirm restart
  void confirmRestart() {
    if (aPoints == 0) {
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return a dialog object type
          return Padding(
            padding: const EdgeInsets.all(60),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: AlertDialog(
                backgroundColor: const Color(0xFF1A1A1A),
                title: Text(
                  "Tem certeza que quer recomeçar a partida?",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    color: Colors.grey.shade100,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.red.shade300,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      "Sim",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.blue.shade300,
                      ),
                    ),
                    onPressed: () {
                      restart();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
    if (bPoints == 0) {
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return a dialog object type
          return Padding(
            padding: const EdgeInsets.all(60),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: AlertDialog(
                backgroundColor: const Color(0xFF1A1A1A),
                title: Text(
                  "Tem certeza que quer recomeçar a partida?",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    color: Colors.grey.shade100,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.red.shade300,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      "Sim",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.blue.shade300,
                      ),
                    ),
                    onPressed: () {
                      restart();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  void confirmFinish() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          title: Text(
            "Tem certeza que quer terminar a partida?",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade100,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.red.shade300,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                "Sim",
                style: TextStyle(
                  color: Colors.blue.shade300,
                ),
              ),
              onPressed: () {
                restart();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      key: _scaffoldKey,
      drawer: const ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Menu(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "NoTruco",
          style: TextStyle(
              color: Color(0xFFCCCCCC), fontSize: 25, fontFamily: 'Conthrax'),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
        ),
        padding: const EdgeInsets.all(16),
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
                      onPressed: () => increment1APoint(),
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
                      onPressed: () => increment3APoints(),
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
                      onPressed: () => increment6APoints(),
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
                      onPressed: () => less1APoint(),
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
                      onPressed: () => confirmRestart(),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(70)),
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
                      onPressed: () => increment1BPoint(),
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
                      onPressed: () => increment3BPoints(),
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
                      onPressed: () => increment6BPoints(),
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
                      onPressed: () => less1BPoint(),
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
                        confirmFinish();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(70)),
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
