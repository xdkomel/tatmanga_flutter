import 'dart:collection';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/domain/models/local_firebase_options.dart';

class Env {
  Option<HashMap<String, String>> _env = const None();

  Future<HashMap<String, String>> _init() async {
    await dotenv.load(fileName: ".env");
    final hm = HashMap<String, String>.from(dotenv.env);
    _env = Some(hm);
    return hm;
  }

  Future<String> _take(String key) => _env.fold(
        () async {
          final hm = await _init();
          return hm[key]!;
        },
        (e) => Future.value(e[key]!),
      );

  Future<List<String>> get admins async {
    final emails = await _take('ADMINS');
    return (jsonDecode(emails) as List)
        .map(
          (e) => e as String,
        )
        .toList();
  }

  Future<FirebaseOptions> get firebaseOptions async {
    final opts = await _take('WEB');
    return LocalFirebaseOptions.fromJson(
      jsonDecode(opts) as Map<String, dynamic>,
    ).toFirebaseOptions;
  }
}
