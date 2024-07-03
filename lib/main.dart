import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/domain/models/local_firebase_options.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/homepage.dart';

List<String>? adminEmails;
FirebaseOptions? web;

void _parseStaticValues() {
  final webData = jsonDecode(const String.fromEnvironment('WEB'));
  final emailsData = jsonDecode(const String.fromEnvironment('EMAILS'));
  web = LocalFirebaseOptions.fromJson(webData as Map<String, dynamic>).toFirebaseOptions;
  adminEmails = (emailsData as List).map((e) => e as String).toList();
}

void main() {
  _parseStaticValues();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Tatmanga',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Styles.primary),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
