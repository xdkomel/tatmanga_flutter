import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'i18n/strings.g.dart';
import 'presentation/common/styles.dart';
import 'presentation/homepage.dart';
import 'providers.dart';
import 'routing/router_delegate.dart';
import 'utils/tt_localization_delegate.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  initializeDateFormatting();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final providerContainer = ProviderContainer();
  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const HomePage(child: _MaterialApp()),
    ),
  );
}

class _MaterialApp extends ConsumerWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: routerDelegate,
        ),
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
      );

  // MaterialApp(
  // locale: ref
  //     .watch(SP.localizationManager)
  //     .translations
  //     .$meta
  //     .locale
  //     .flutterLocale,
  // supportedLocales: AppLocaleUtils.supportedLocales,
  // localizationsDelegates: [
  //   ...GlobalMaterialLocalizations.delegates,
  //   TtMaterialLocalizationDelegate(),
  //   TtCupertinoLocalizationDelegate(),
  // ],
  // title: ref.watch(SP.localizationManager).translations.common.name,
  // theme: ThemeData(
  //   colorScheme: ColorScheme.fromSeed(seedColor: Styles.primary),
  //   useMaterial3: true,
  // ),
  //       home: const HomePage(),
  //     );
}
