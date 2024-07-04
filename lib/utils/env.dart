import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:tatmanga_flutter/domain/models/local_firebase_options.dart';

class Env {
  String _take(String key) => String.fromEnvironment(key);

  Future<List<String>> get admins async {
    final emails = _take('ADMINS');
    return (jsonDecode(emails) as List)
        .map(
          (e) => e as String,
        )
        .toList();
  }

  Future<FirebaseOptions> get firebaseOptions async {
    final opts = _take('WEB');
    return LocalFirebaseOptions.fromJson(
      jsonDecode(opts) as Map<String, dynamic>,
    ).toFirebaseOptions;
  }
}
