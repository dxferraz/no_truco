import 'package:flutter/material.dart';
import 'package:no_truco/Components/menu/menu_widgets.dart';
import 'package:no_truco/themes/theme.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(
            fontFamily: 'Conthrax',
            fontSize: 20,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          padding: const EdgeInsets.only(
            top: 30,
            right: 20,
            left: 20,
            bottom: 30,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  configSwitch(
                    icon: Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: "Modo escuro",
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider =
                          Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}