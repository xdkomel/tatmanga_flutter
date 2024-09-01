import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class TtMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tt';

  @override
  Future<MaterialLocalizations> load(Locale locale) => Future.value(
        MaterialLocalizationTt(),
      );

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<MaterialLocalizations> old,
  ) =>
      false;
}

class TtCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'tt';

  @override
  Future<CupertinoLocalizations> load(Locale locale) => Future.value(
        CupertinoLocalizationTt(),
      );

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<CupertinoLocalizations> old,
  ) =>
      false;
}

class MaterialLocalizationTt extends MaterialLocalizationRu {
  MaterialLocalizationTt()
      : super(
          localeName: 'tt',
          fullYearFormat: DateFormat.y('ru'),
          compactDateFormat: DateFormat.yMd('ru'),
          shortDateFormat: DateFormat.yMd('ru'),
          mediumDateFormat: DateFormat.MMMd('ru'),
          longDateFormat: DateFormat.yMMMMEEEEd('ru'),
          yearMonthFormat: DateFormat.yMMMM('ru'),
          shortMonthDayFormat: DateFormat.MMMd('ru'),
          decimalFormat: NumberFormat.decimalPattern('ru'),
          twoDigitZeroPaddedFormat: NumberFormat('00'),
        );
}

class CupertinoLocalizationTt extends CupertinoLocalizationRu {
  CupertinoLocalizationTt()
      : super(
          localeName: 'tt',
          fullYearFormat: DateFormat.y('ru'),
          dayFormat: DateFormat.d('ru'),
          mediumDateFormat: DateFormat.MMMd('ru'),
          singleDigitHourFormat: DateFormat('H'),
          singleDigitMinuteFormat: DateFormat('m'),
          doubleDigitMinuteFormat: DateFormat('mm'),
          singleDigitSecondFormat: DateFormat('s'),
          decimalFormat: NumberFormat.decimalPattern('ru'),
        );
}
