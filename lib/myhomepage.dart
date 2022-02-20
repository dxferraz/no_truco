import 'package:flutter/material.dart';
import 'showWinner.dart';
import 'menu.dart';
import 'var.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

HomePage home = const HomePage();

class HomePageState extends State<HomePage> {

  //Add points to A Team
  void increment1APoint() {
    setState(() {
      aPoints++;
    });
    verify();
  }

  void increment3APoints() {
    setState(() {
      aPoints = aPoints + 3;
    });
    verify();
  }

  void increment6APoints() {
    setState(() {
      aPoints = aPoints + 6;
    });
    verify();
  }

  void less1APoint() {
    setState(() {
      if (aPoints > 0) {
        aPoints = aPoints - 1;
      } else {}
    });
  }

  //Add points to B Team
  void increment1BPoint() {
    setState(() {
      bPoints++;
    });
    verify();
  }

  void increment3BPoints() {
    setState(() {
      bPoints = bPoints + 3;
    });
    verify();
  }

  void increment6BPoints() {
    setState(() {
      bPoints = bPoints + 6;
    });
    verify();
  }

  void less1BPoint() {
    setState(() {
      if (bPoints > 0) {
        bPoints = bPoints - 1;
      } else {}
    });
  }

  //Restart points
  void restart() {
    setState(() {
      aPoints = aPoints = 0;
      bPoints = bPoints = 0;
    });
  }

  //Verify winner
  void verify() {
    if (aPoints >= 12 || bPoints >= 12) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ShowWinner();
        },
      );
      setState(() {
      aPoints = aPoints = 0;
      bPoints = bPoints = 0;
      });
    }
  }

  //Confirm restart
  void confirmRestart() {
    if(aPoints==0){
  
    }else{
      showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return Padding(
          padding: const EdgeInsets.all(60),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
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
    if(bPoints==0){

    }else{
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(60),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
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
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        endDrawer: const ClipRRect(
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(35),
          bottomRight: Radius.circular(35)
          ),
          child: Menu(),
        ),
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("NoTruco", style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 25, fontFamily: 'Conthrax'),),
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
                      'src/img/ClubsIcon.png',
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
                        color: Colors.grey.shade700,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){increment1APoint();},
                      child: Image.asset(
                        'src/img/+1Button.png',
                        width: 60,
                        height: 60,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){increment3APoints();},
                      child: Image.asset(
                        'src/img/+3Button.png',
                        width: 60,
                        height: 60,
                      )
                    ),
                    TextButton(
                      onPressed: (){increment6APoints();},
                      child: Image.asset(
                        'src/img/+6Button.png',
                        width: 60,
                        height: 60,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){less1APoint();},
                      child: Image.asset(
                        'src/img/-1Button.png',
                        width: 60,
                        height: 60,
                      )
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){confirmRestart();},
                      child: Image.asset(
                        'src/img/RestartButton.png',
                        width: 150,
                      )
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
                      'src/img/HeartsIcon.png',
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
                        color: Colors.grey.shade700,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                        onPressed: (){increment1BPoint();},
                        child: Image.asset(
                          'src/img/+1Button.png',
                          width: 60,
                          height: 60,
                        )),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: (){increment3BPoints();},
                        child: Image.asset(
                          'src/img/+3Button.png',
                          width: 60,
                          height: 60,
                        )),
                    TextButton(
                      onPressed: (){increment6BPoints();},
                        child: Image.asset(
                          'src/img/+6Button.png',
                          width: 60,
                          height: 60,
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: (){less1BPoint();},
                        child: Image.asset(
                          'src/img/-1Button.png',
                          width: 60,
                          height: 60,
                        )),
                  ],
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){confirmFinish();},
                      child: Image.asset(
                        'src/img/FinishButton.png',
                        width: 150,
                      )
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