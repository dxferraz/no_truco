// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({ Key? key }) : super(key: key);

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
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Minha Conta",
                    style:
                    TextStyle(
                      fontFamily: 'Conthrax',
                      fontSize: 25,
                      color: Color(0xFFCCCCCC),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
    ),
    );
  }
}