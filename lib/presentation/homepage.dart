import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/manga_list/manga_list_screen.dart';
import 'package:tatmanga_flutter/providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _firebaseInitialized = false;

  @override
  void initState() {
    initFirebase();
    super.initState();
  }

  Future<void> initFirebase() async {
    final options = await ref.read(P.env).firebaseOptions;
    await Firebase.initializeApp(options: options);
    setState(() => _firebaseInitialized = true);
  }

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _firebaseInitialized
            ? const MangaListScreen()
            : const CircularProgressIndicator(),
      );
}
