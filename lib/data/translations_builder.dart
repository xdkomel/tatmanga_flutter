import 'dart:collection';

import 'package:tatmanga_flutter/i18n/strings.g.dart';
import 'package:tatmanga_flutter/presentation/common/localization_manager.dart';

class TranslationsBuilder {
  final HashMap<Language, Translations> _translations = HashMap();

  Translations buildFor(Language language) =>
      _translations[language] ?? _takeAndSave(language);

  Translations _takeAndSave(Language language) {
    final translation = switch (language) {
      Language.en => AppLocale.en.build(),
      Language.ru => AppLocale.ru.build(),
      Language.tt => AppLocale.tt.build(
          cardinalResolver: (
            number, {
            String? few,
            String? many,
            String? one,
            String? other,
            String? two,
            String? zero,
          }) =>
              switch (number) {
            1 => one ?? other!,
            _ => other!,
          },
        ),
    };
    _translations[language] = translation;
    return translation;
  }
}
