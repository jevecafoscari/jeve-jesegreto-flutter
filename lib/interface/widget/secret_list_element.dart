import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';

class SecretListElement extends StatelessWidget {
  final SecretModel secret;

  const SecretListElement({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    return Text(secret.body);
  }
}
