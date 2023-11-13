import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';
import 'package:jeve_jesegreto_flutter/references.dart';

class SecretListElement extends StatelessWidget {
  final SecretModel secret;

  const SecretListElement({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    late String sexString;
    late Color color;
    switch (secret.author.sex) {
      case Sex.male:
        sexString = "Uomo";
        color = Colors.blue;
      case Sex.female:
        sexString = "Donna";
        color = Colors.pink;
      case Sex.other:
        sexString = "Non specificato";
        color = Colors.grey;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      color: color,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("$sexString di ${secret.author.age} anni",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 16.0),
                Text(secret.body, style: TextStyle(color: Colors.white)),
                SizedBox(height: 8.0),
                // Date time in format: 2021-10-10 10:10:10
                Text(References.secretDateFormat.format(secret.dateTime), style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          if (secret.attachmentUrl != null) Image.network(secret.attachmentUrl!),
        ],
      ),
    );
  }
}
