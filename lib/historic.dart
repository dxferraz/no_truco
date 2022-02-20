import 'package:flutter/material.dart';

class Historic extends StatefulWidget {
  const Historic({ Key? key }) : super(key: key);

  @override
  _HistoricState createState() => _HistoricState();

}


class _HistoricState extends State<Historic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.all(Radius.circular(25)),),
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Histórico",
                    style:
                    TextStyle(
                      fontFamily: 'Conthrax',
                      fontSize: 25,
                      color: Color(0xFFCCCCCC),
                      ),
                  ),
                ],
              ),
              ListView(
                children: [
                  TextButton(onPressed: (){}, child: const Text("Hoje"))
                ],
              ),
            ],
          ),
        ),
    ),
    );
  }
}