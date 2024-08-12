import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:tatmanga_flutter/domain/models/local_firebase_options.dart';

class Env {
  Future<List<String>> get admins async {
    const emails = String.fromEnvironment('EMAILS');
    return (jsonDecode(emails) as List)
        .map(
          (e) => e as String,
        )
        .toList();
  }

  Future<FirebaseOptions> get firebaseOptions async {
    const opts = String.fromEnvironment('WEB');
    return LocalFirebaseOptions.fromJson(
      jsonDecode(opts) as Map<String, dynamic>,
    ).toFirebaseOptions;
  }
}
