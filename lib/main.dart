import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/i18n/strings.g.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/homepage.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/tt_localization_delegate.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  final providerContainer = ProviderContainer();
  // providerContainer.read(P.fluroRouter)
  //   ..define(
  //     '/library',
  //     handler: Handler(
  //       handlerFunc: (context, _) => const MangaListScreen(),
  //     ),
  //   )
  //   ..define('/manga/', handler: handler);
  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const _MaterialApp(),
    ),
  );
}

class _MaterialApp extends ConsumerWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        locale: ref
            .watch(SP.localizationManager)
            .translations
            .$meta
            .locale
            .flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
          TtMaterialLocalizationDelegate(),
          TtCupertinoLocalizationDelegate(),
        ],
        title: ref.watch(SP.localizationManager).translations.common.name,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Styles.primary),
          useMaterial3: true,
        ),
        home: const HomePage(),
      );
}
