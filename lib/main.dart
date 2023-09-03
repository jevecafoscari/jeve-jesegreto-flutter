import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/interface/screen/home_screen.dart';
import 'package:jeve_jesegreto_flutter/interface/screen/splash_screen.dart';
import 'package:jeve_jesegreto_flutter/references.dart';

void main() {
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
      routes: <String, Widget Function(BuildContext)>{
        HomeScreen.route: (final BuildContext context) => const HomeScreen(),
        SplashScreen.route: (final BuildContext context) => const SplashScreen(),
      },
    );
  }
}
