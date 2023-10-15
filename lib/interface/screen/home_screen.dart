import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jeve_jesegreto_flutter/generated/assets.dart';
import 'package:jeve_jesegreto_flutter/interface/widget/secret_list_element.dart';
import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';
import 'package:jeve_jesegreto_flutter/references.dart';
import 'package:jeve_jesegreto_flutter/resources/helper/secret_helper.dart';
import 'package:jeve_jesegreto_flutter/resources/helper/validator_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(References.appName)),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody() {
    final Query<SecretModel> secretsQuery =
        FirebaseFirestore.instance.collection(References.secretsCollection).orderBy("dateTime", descending: true).withConverter<SecretModel>(
              fromFirestore: (snapshot, _) => SecretModel.fromJson(snapshot.data()!),
              toFirestore: (final SecretModel secret, _) => secret.toJson(),
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: FirestoreListView<SecretModel>(
            controller: scrollController,
            query: secretsQuery,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, snapshot) {
              final SecretModel secretModel = snapshot.data();
              return SecretListElement(secret: secretModel);
            },
          ),
        ),
        Material(
          elevation: 20,
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => launchUrlString("https://instagram.com/emiliodallatorre"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Proudly brought to you by Emilio",
                    style: TextStyle(decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        final SecretModel? secret = await showDialog<SecretModel>(
          context: context,
          builder: (BuildContext context) {
            final GlobalKey<FormState> formKey = GlobalKey<FormState>();
            String? secret;
            String? age;
            Sex sex = Sex.male;

            return AlertDialog(
              title: Text("Inserisci un segreto"),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      validator: ValidatorHelper.requiredValidator,
                      decoration: InputDecoration(
                        hintText: "Testo del segreto",
                      ),
                      minLines: 4,
                      maxLines: 8,
                      maxLength: 280,
                      onChanged: (final String value) {
                        secret = value;
                      },
                    ),
                    TextFormField(
                      validator: ValidatorHelper.integerValidator,
                      decoration: InputDecoration(
                        hintText: "Età",
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (final String value) {
                        age = value;
                      },
                    ),
                    // Sex DropdownButtonFormField
                    DropdownButtonFormField<Sex>(
                      decoration: InputDecoration(label: Text("Sesso")),
                      items: Sex.values.map((final Sex sex) {
                        late String label;

                        switch (sex) {
                          case Sex.male:
                            label = "Uomo";
                          case Sex.female:
                            label = "Donna";
                          case Sex.other:
                            label = "Preferisco non rispondere";
                        }

                        return DropdownMenuItem<Sex>(value: sex, child: Text(label));
                      }).toList(),
                      onChanged: (final Sex? selectedSex) => sex = selectedSex ?? sex,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text("Annulla"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text("Inserisci"),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final SecretModel secretModel = SecretModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        dateTime: DateTime.now(),
                        body: secret!,
                        author: AuthorModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          sex: sex ?? Sex.other,
                          age: int.parse(age!),
                        ),
                      );

                      Navigator.of(context).pop(secretModel);
                    }
                  },
                ),
              ],
            );
          },
        );

        if (secret != null) {
          await SecretHelper().createSecret(secret, secret.author);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Segreto inserito con successo"),
            ),
          );
          scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);

          setState(() {});
        }
      },
    );
  }
}
