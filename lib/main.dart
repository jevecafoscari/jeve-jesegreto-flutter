import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/firebase_options.dart';
import 'package:jeve_jesegreto_flutter/interface/screen/home_screen.dart';
import 'package:jeve_jesegreto_flutter/interface/screen/splash_screen.dart';
import 'package:jeve_jesegreto_flutter/references.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await initializeDateFormatting('it_IT', "");

  runApp(const JESegreto());
}

class JESegreto extends StatelessWidget {
  const JESegreto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: References.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.route,
      routes: <String, Widget Function(BuildContext)>{
        HomeScreen.route: (final BuildContext context) => const HomeScreen(),
        SplashScreen.route: (final BuildContext context) => const SplashScreen(),
      },
    );
  }
}
