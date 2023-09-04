import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_truco/services/functions/auth_functions.dart';
import '../../pages/configurations/configurations.dart';
import '../../pages/my_account/my_account.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      //color: Color(0xFF1A1A1A),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              size: 30,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Menu",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
              fontFamily: 'Conthrax',
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyAccount(),
                        ),
                      );
                    },
                    child: const Text(
                      "Minha Conta",
                      style: TextStyle(
                        fontFamily: 'CairoSBold',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFCCCCCC),
                      textStyle: const TextStyle(
                        fontFamily: 'CairoSBold',
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Config()),
                      );
                    },
                    child: const Text("Configurações"),
                  )
                ],
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFCCCCCC),
                      textStyle: const TextStyle(
                        fontFamily: 'CairoSBold',
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        AuthServices().signOutUser();
                      });
                    },
                    child: const Text("Desconectar"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${FirebaseAuth.instance.currentUser?.email}",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
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