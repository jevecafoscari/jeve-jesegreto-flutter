import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';

class SecretListElement extends StatelessWidget {
  final SecretModel secret;

  const SecretListElement({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    late String sex;
    late Color color;
    switch (secret.author.sex) {
      case Sex.male:
        sex = "Uomo";
        color = Colors.blue;
      case Sex.female:
        sex = "Donna";
        color = Colors.pink;
      case Sex.other:
        sex = "Non specificato";
        color = Colors.grey;
    }


    return Card(
      color: color.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("$sex di ${secret.author.age} anni", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Text(secret.body),
            SizedBox(height: 8.0),
            // Date time in format: 2021-10-10 10:10:10
            Text(secret.dateTime.toString()),
          ],
        ),
      ),
    );
  }
}
