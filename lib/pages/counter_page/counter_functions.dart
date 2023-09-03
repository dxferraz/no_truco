import 'package:flutter/material.dart';
import 'package:no_truco/Components/popups/show_winner.dart';
import 'package:page_transition/page_transition.dart';

int aPoints = 0;
int bPoints = 0;

void increment1APoint() {
  aPoints++;
  
}

void increment3APoints() {
  aPoints = aPoints + 3;
  
}

void increment6APoints() {
  aPoints = aPoints + 6;
  
}

void less1APoint() {
  if (aPoints > 0) {
    aPoints = aPoints - 1;
  } else {}
}

//Add points to B Team
void increment1BPoint() {
  bPoints++;
  
}

void increment3BPoints() {
  bPoints = bPoints + 3;
  
}

void increment6BPoints() {
  bPoints = bPoints + 6;
  
}

void less1BPoint() {
  if (bPoints > 0) {
    bPoints = bPoints - 1;
  } else {}
}

//Restart points
void restart() {
  aPoints = aPoints = 0;
  bPoints = bPoints = 0;
}

//Verify winner
void verify(context) {
  if (aPoints >= 12) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.scale,
        duration: const Duration(seconds: 1),
        alignment: Alignment.center,
        child: const ShowAWinner(),
      ),
    );

    aPoints = aPoints = 0;
    bPoints = bPoints = 0;
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
    
        aPoints = aPoints = 0;
        bPoints = bPoints = 0;
      
  }
}

//Confirm restart
void confirmRestart(context) {
  if (aPoints == 0) {
  } else {
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
  if (bPoints == 0) {
  } else {
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
