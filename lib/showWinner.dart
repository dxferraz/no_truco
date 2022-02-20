// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'myhomepage.dart';


class ShowWinner extends StatefulWidget {
  const ShowWinner({ Key? key }) : super(key: key);

  @override
  _ShowWinnerState createState() => _ShowWinnerState();

  
}

class _ShowWinnerState extends State<ShowWinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, right: 50, bottom: 150, left: 50),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius:BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "O Time",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 35,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Venceu a partida",
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 30,
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
                        onPressed: ()
                          {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                        icon: Image.asset('src/img/RestartIcon.png')
                      ),

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
                        onPressed: ()
                        {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        icon: Image.asset('src/img/start.png')
                      ),

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
          )
        ),
      ),
    );
  }
}