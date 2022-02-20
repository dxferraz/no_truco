import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Olá, Fernando!",
              style: TextStyle(fontSize: 18),
            ),
            Image.asset(
              'src/profile.png',
              width: 70,
              height: 70,
            )
          ],
        ),
        ListTile(
          onTap: (){},
          title: const Text("Minha Conta"),
        ),
        ListTile(
          onTap: (){},
          title: const Text("Histórico"),
        ),
        ListTile(
          onTap: (){},
          title: const Text("Configurações"),
        ),
        ListTile(
          onTap: (){},
          title: const Text("Minha Conta"),
        ),
      ],
    );
  }
}