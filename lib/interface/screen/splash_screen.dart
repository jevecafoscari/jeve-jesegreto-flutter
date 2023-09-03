import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/generated/assets.dart';
import 'package:jeve_jesegreto_flutter/interface/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "/splashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(final BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1 / 2,
                    child: Image.asset(Assets.assetsLogoJeitaly),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "JE Segreto",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    """Per me si va ne'l network dolente,\n[...]\nper me si va tra la perduta JEnte.""",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text("Accetto di usare questo strumento per pura goliardia"),
              onPressed: () => Navigator.of(context).pushReplacementNamed(HomeScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}
