import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/i18n/strings.g.dart';
import 'package:tatmanga_flutter/providers.dart';

enum Language { ru, tt, en }

class LocalizationState {
  final Translations translations;
  final Language language;
  const LocalizationState({
    required this.language,
    required this.translations,
  });
}

class LocalizationManager extends Notifier<LocalizationState> {
  @override
  LocalizationState build() => LocalizationState(
        language: Language.tt,
        translations: ref.read(P.translationsBuilder).buildFor(Language.tt),
      );

  void toggleLocalization() => setLocalization(
        Language.values[(Language.values.indexOf(state.language) + 1) %
            Language.values.length],
      );

  void setLocalization(Language language) => state = LocalizationState(
        language: language,
        translations: ref.read(P.translationsBuilder).buildFor(language),
      );
}
