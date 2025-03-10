import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../common/styles.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ref.watch(SP.localizationManager).translations.notFound.title,
              style: Styles.h3b,
            ),
            const SizedBox(height: 8),
            Text(
              ref.watch(SP.localizationManager).translations.notFound.body,
              style: Styles.pr,
            ),
          ],
        ),
      ),
    );
  }
}
