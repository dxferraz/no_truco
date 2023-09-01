import 'dart:async';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int counter = 0;
  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  void startTimer() {
    counter = 0;

    (timer) {
      setState(
        () {
          if (counter <= 0) {
            counter++;
          }
        },
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$counter',
          style: const TextStyle(
            fontFamily: 'Conthrax',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}