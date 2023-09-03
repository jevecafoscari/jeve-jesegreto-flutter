import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';
import 'package:jeve_jesegreto_flutter/references.dart';

class SecretHelper {
  final CollectionReference secretsCollection = FirebaseFirestore.instance.collection(References.secretsCollection);

  /// Crea un segreto nel database.
  Future<void> createSecret(final SecretModel secret, final AuthorModel author) async {
    final DocumentReference secretDocument = secretsCollection.doc(secret.id);

    secret.author = author;

    await secretDocument.set(secret.toJson());
  }
}
