import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:no_truco/pages/intro/introduction.dart';
import 'package:no_truco/firebase_options.dart';
import 'package:no_truco/features/counter/presenter/counter_page.dart.dart';
import 'package:no_truco/core/themes/dark_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:no_truco/core/themes/light_theme.dart';
import 'package:no_truco/core/themes/theme_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Animate.restartOnHotReload = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: themeNotifier.isDark
                ? const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light,
                    systemNavigationBarColor: Colors.transparent,
                    systemNavigationBarIconBrightness: Brightness.light,
                  )
                : const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark,
                    systemNavigationBarColor: Colors.transparent,
                    systemNavigationBarIconBrightness: Brightness.dark,
                  ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: l10n.noTruco,
              theme: themeNotifier.isDark ? darkTheme : lightTheme,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('pt', 'BR'),
              ],
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const CounterPage();
                  } else {
                    return const IntroductionScreen();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
