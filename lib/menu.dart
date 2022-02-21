import 'package:flutter/material.dart';
import 'config.dart';
import 'historic.dart';
import 'myAccount.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
      //color: Color(0xFF1A1A1A),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Menu",
                style: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 24,
                    fontFamily: 'Conthrax'),
              ),
            ],
          ),
          const Spacer(flex: 4),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xFFCCCCCC),
                    textStyle:
                        const TextStyle(fontFamily: 'CairoSBold', fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Historic()),
                    );
                  },
                  child: const Text("Histórico"))
            ],
          ),
          const Spacer(flex: 1),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xFFCCCCCC),
                    textStyle:
                        const TextStyle(fontFamily: 'CairoSBold', fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAccount()),
                    );
                  },
                  child: const Text("Minha Conta")),
            ],
          ),
          const Spacer(flex: 1),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xFFCCCCCC),
                    textStyle:
                        const TextStyle(fontFamily: 'CairoSBold', fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Config()),
                    );
                  },
                  child: const Text("Configurações"))
            ],
          ),
          const Spacer(flex: 1),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xFFCCCCCC),
                    textStyle:
                        const TextStyle(fontFamily: 'CairoSBold', fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Historic()),
                    );
                  },
                  child: const Text("Desconectar"))
            ],
          ),
          const Spacer(flex: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0xFFCCCCCC),
                    textStyle:
                        const TextStyle(fontFamily: 'Conthrax', fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Historic()),
                    );
                  },
                  child: const Text(
                    "Dxferraz",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
