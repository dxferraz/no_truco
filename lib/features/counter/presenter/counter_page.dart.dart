import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_truco/Components/popups/rename_team.dart';
import 'package:no_truco/features/counter/domain/counter_functions.dart';
import 'package:no_truco/core/themes/theme_model.dart';
import 'package:provider/provider.dart';
import '../../../Components/menu/menu.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

CounterPage home = const CounterPage();

IconData _iconDark = Icons.nights_stay;
IconData _iconLight = Icons.wb_sunny;

class CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModel themeNotifier, child) {
        bool iconBool = themeNotifier.isDark;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          key: _scaffoldKey,
          drawer: const ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            child: Menu(),
          ),
          appBar: AppBar(
            leading: IconButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "NoTruco",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20,
                fontFamily: 'Conthrax',
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                  iconBool = !iconBool;
                },
                icon: Icon(
                  iconBool ? _iconLight : _iconDark,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
            systemOverlayStyle: themeNotifier.isDark
                ? const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light,
                    systemNavigationBarColor: Colors.transparent,
                  )
                : const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                    systemNavigationBarIconBrightness: Brightness.dark,
                    systemNavigationBarColor: Colors.transparent,
                  ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Left Side
                Column(
                  children: [
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/ClubsIcon.png',
                          alignment: Alignment.center,
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                    Text(
                      aTeamName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$aPoints',
                          style: TextStyle(
                            fontFamily: 'Conthrax',
                            color: Colors.grey.shade500,
                            fontSize: 70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pts',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'A';
                            setState(() {
                              increment1Point(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                            child: const Text(
                              "+1",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'A';
                            setState(() {
                              increment3Points(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                            child: const Text(
                              "+3",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              team = 'A';
                              increment6Points(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                            child: const Text(
                              "+6",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'A';
                            setState(() {
                              less1Point(team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 175, 127, 126),
                            ),
                            child: const Text(
                              "-1",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              confirmRestart(context);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            width: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(70),
                              ),
                              color: Color.fromARGB(255, 179, 179, 179),
                            ),
                            child: const Center(
                              child: Text(
                                "Recomeçar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 26, 26),
                                  fontSize: 14,
                                  fontFamily: "Conthrax",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
                //Right Side
                Column(
                  children: [
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/HeartsIcon.png',
                          alignment: Alignment.center,
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const RenameTeamPopUp(),
                        );
                      },
                      icon: const Icon(Icons.edit, size: 20),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSurface,
                        backgroundColor:
                            Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      label: Text(
                        bTeamName,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$bPoints',
                          style: TextStyle(
                            fontFamily: 'Conthrax',
                            color: Colors.grey.shade500,
                            fontSize: 70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pts',
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'B';
                            setState(() {
                              increment1Point(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                            child: const Text(
                              "+1",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'B';
                            setState(() {
                              increment3Points(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                            child: const Text(
                              "+3",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            team = 'B';
                            setState(() {
                              increment6Points(context, team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(
                                255,
                                158,
                                158,
                                158,
                              ),
                            ),
                            child: const Text(
                              "+6",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            team = 'B';
                            setState(() {
                              less1Point(team);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 175, 127, 126),
                            ),
                            child: const Text(
                              "-1",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 26, 26),
                                fontSize: 24,
                                fontFamily: "Conthrax",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              confirmFinish(context);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            width: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(70),
                              ),
                              color: Color.fromARGB(255, 179, 179, 179),
                            ),
                            child: const Center(
                              child: Text(
                                "Terminar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 26, 26),
                                  fontSize: 14,
                                  fontFamily: "Conthrax",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
