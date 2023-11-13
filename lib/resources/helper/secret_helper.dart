import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jeve_jesegreto_flutter/models/author_model.dart';
import 'package:jeve_jesegreto_flutter/models/secret_model.dart';
import 'package:jeve_jesegreto_flutter/references.dart';

class SecretHelper {
  final CollectionReference secretsCollection = FirebaseFirestore.instance.collection(References.secretsCollection);

  /// Crea un segreto nel database.
  Future<void> createSecret(final SecretModel secret, final AuthorModel author, final Uint8List? attachment) async {
    final DocumentReference secretDocument = secretsCollection.doc(secret.id);

    secret.author = author;
    if (attachment != null) {
      secret.attachmentUrl = await uploadSecretAttachment(attachment, secret.id);
    }

    await secretDocument.set(secret.toJson());
  }

  Future<String> uploadSecretAttachment(final Uint8List attachment, final String secretId) async {
    final Reference reference = FirebaseStorage.instance.ref("${References.secretsCollection}/$secretId.png");

    await reference.putData(attachment);

    return await reference.getDownloadURL();
  }
}
