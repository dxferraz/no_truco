import 'package:flutter/material.dart';
import 'package:no_truco/Components/popups/show_winner.dart';
import 'package:page_transition/page_transition.dart';

var aPoints = 0;
var bPoints = 0;
var team = '';
var winner = '';

void increment1Point(context, team) {
  if (team == "A") {
    aPoints = aPoints + 1;
  } else if (team == "B") {
    bPoints = bPoints + 1;
  }
  verify(context);
}

void increment3Points(context, team) {
  if (team == "A") {
    aPoints = aPoints + 3;
  } else if (team == "B") {
    bPoints = bPoints + 3;
  }
  verify(context);
}

void increment6Points(context, team) {
  if (team == "A") {
    aPoints = aPoints + 6;
  } else if (team == "B") {
    bPoints = bPoints + 6;
  }
  verify(context);
}

void less1Point(team) {
  if (team == "A" && aPoints > 0) {
    aPoints = aPoints - 1;
  } else if (team == "B" && bPoints > 0) {
    bPoints = bPoints - 1;
  }
}

void confirmRestart(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return a dialog object type
      return Padding(
        padding: const EdgeInsets.all(60),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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

void confirmFinish(context) {
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

void verify(context) {
  if (aPoints >= 12) {
    winner = 'A';
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.scale,
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        child: const ShowAWinner(),
      ),
    );
    restart();
  }
  if (bPoints >= 12) {
    winner = 'B';
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.scale,
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        child: const ShowBWinner(),
      ),
    );
    restart();
  }
}

//Restart points
void restart() {
  aPoints = aPoints = 0;
  bPoints = bPoints = 0;
}