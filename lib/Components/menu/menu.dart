import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no_truco/Components/menu/menu_widgets.dart';
import 'package:no_truco/pages/intro/introduction.dart';
import '../../pages/configurations/configurations.dart';
import '../../pages/my_account/my_account.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  menuTile(
                    title: 'Minha Conta',
                    context: context,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyAccount(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  menuTile(
                    title: 'Configurações',
                    context: context,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Config(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser?.email == null
                        ? ""
                        : "${FirebaseAuth.instance.currentUser?.email}",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              FirebaseAuth.instance.currentUser?.email == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const IntroductionScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.login,
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 20,
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
