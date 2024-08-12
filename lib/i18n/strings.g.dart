/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 60 (20 per locale)
///
/// Built on 2024-08-12 at 17:55 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: StringsRu.build),
	tt(languageCode: 'tt', build: StringsTt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
typedef StringsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final StringsMangaListEn mangaList = StringsMangaListEn._(_root);
	late final StringsCommonEn common = StringsCommonEn._(_root);
	late final StringsMangaContentsEn mangaContents = StringsMangaContentsEn._(_root);
	late final StringsMangaChapterContentsEn mangaChapterContents = StringsMangaChapterContentsEn._(_root);
}

// Path: mangaList
class StringsMangaListEn {
	StringsMangaListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get library => 'Library';
	late final StringsMangaListEpisodesCountEn episodesCount = StringsMangaListEpisodesCountEn._(_root);
}

// Path: common
class StringsCommonEn {
	StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tatmanga';
	String get stopEditing => 'Stop editing';
	String get edit => 'Edit';
	String get authorize => 'Authorize';
	String get manga => 'Manga';
}

// Path: mangaContents
class StringsMangaContentsEn {
	StringsMangaContentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get addAuthor => 'Add an author';
	String get name => 'Name';
	String get role => 'Role';
	String get addEpisode => 'Add episode';
	late final StringsMangaContentsEpisodeDefaultEn episodeDefault = StringsMangaContentsEpisodeDefaultEn._(_root);
	String get coverChange => 'Change';
	String get coverRemove => 'Remove';
	String get mangaDescription => 'Description';
	String get mangaTitle => 'Title';
	String get save => 'Save';
}

// Path: mangaChapterContents
class StringsMangaChapterContentsEn {
	StringsMangaChapterContentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get episodeName => 'Episode name';
	String get addImages => 'Add images';
}

// Path: mangaList.episodesCount
class StringsMangaListEpisodesCountEn {
	StringsMangaListEpisodesCountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 episode',
		other: '${n} episodes',
	);
}

// Path: mangaContents.episodeDefault
class StringsMangaContentsEpisodeDefaultEn {
	StringsMangaContentsEpisodeDefaultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String episode({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		other: 'Episode ${n}',
	);
}

// Path: <root>
class StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final StringsMangaListRu mangaList = StringsMangaListRu._(_root);
	@override late final StringsCommonRu common = StringsCommonRu._(_root);
	@override late final StringsMangaContentsRu mangaContents = StringsMangaContentsRu._(_root);
	@override late final StringsMangaChapterContentsRu mangaChapterContents = StringsMangaChapterContentsRu._(_root);
}

// Path: mangaList
class StringsMangaListRu implements StringsMangaListEn {
	StringsMangaListRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String get library => 'Библиотека';
	@override late final StringsMangaListEpisodesCountRu episodesCount = StringsMangaListEpisodesCountRu._(_root);
}

// Path: common
class StringsCommonRu implements StringsCommonEn {
	StringsCommonRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'Татманга';
	@override String get stopEditing => 'Завершить редактирование';
	@override String get edit => 'Редактировать';
	@override String get authorize => 'Авторизоваться';
	@override String get manga => 'Манга';
}

// Path: mangaContents
class StringsMangaContentsRu implements StringsMangaContentsEn {
	StringsMangaContentsRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String get addAuthor => 'Добавить автора';
	@override String get name => 'Имя';
	@override String get role => 'Роль';
	@override String get addEpisode => 'Добавить эпизод';
	@override late final StringsMangaContentsEpisodeDefaultRu episodeDefault = StringsMangaContentsEpisodeDefaultRu._(_root);
	@override String get coverChange => 'Сменить';
	@override String get coverRemove => 'Удалить';
	@override String get mangaDescription => 'Описание';
	@override String get mangaTitle => 'Заголовок';
	@override String get save => 'Сохранить';
}

// Path: mangaChapterContents
class StringsMangaChapterContentsRu implements StringsMangaChapterContentsEn {
	StringsMangaChapterContentsRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String get episodeName => 'Навание эпизода';
	@override String get addImages => 'Добавить изображения';
}

// Path: mangaList.episodesCount
class StringsMangaListEpisodesCountRu implements StringsMangaListEpisodesCountEn {
	StringsMangaListEpisodesCountRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '1 эпизод',
		few: '${n} эпизода',
		other: '${n} эпизодов',
	);
}

// Path: mangaContents.episodeDefault
class StringsMangaContentsEpisodeDefaultRu implements StringsMangaContentsEpisodeDefaultEn {
	StringsMangaContentsEpisodeDefaultRu._(this._root);

	@override final StringsRu _root; // ignore: unused_field

	// Translations
	@override String episode({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		other: 'Эпизод ${n}',
	);
}

// Path: <root>
class StringsTt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	StringsTt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final StringsTt _root = this; // ignore: unused_field

	// Translations
	@override late final StringsMangaListTt mangaList = StringsMangaListTt._(_root);
	@override late final StringsCommonTt common = StringsCommonTt._(_root);
	@override late final StringsMangaContentsTt mangaContents = StringsMangaContentsTt._(_root);
	@override late final StringsMangaChapterContentsTt mangaChapterContents = StringsMangaChapterContentsTt._(_root);
}

// Path: mangaList
class StringsMangaListTt implements StringsMangaListEn {
	StringsMangaListTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String get library => 'Мангаханә';
	@override late final StringsMangaListEpisodesCountTt episodesCount = StringsMangaListEpisodesCountTt._(_root);
}

// Path: common
class StringsCommonTt implements StringsCommonEn {
	StringsCommonTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Татманга';
	@override String get stopEditing => 'Үзгәртүне тәмамларга';
	@override String get edit => 'Үзгәртергә';
	@override String get authorize => 'Авторлаштырырга';
	@override String get manga => 'Манга';
}

// Path: mangaContents
class StringsMangaContentsTt implements StringsMangaContentsEn {
	StringsMangaContentsTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String get addAuthor => 'Авторны өстәргә';
	@override String get name => 'Исем';
	@override String get role => 'Роль';
	@override String get addEpisode => 'Эпизодны өстәргә';
	@override late final StringsMangaContentsEpisodeDefaultTt episodeDefault = StringsMangaContentsEpisodeDefaultTt._(_root);
	@override String get coverChange => 'Үзгәртергә';
	@override String get coverRemove => 'Ерагайтырга';
	@override String get mangaDescription => 'Тасвирлама';
	@override String get mangaTitle => 'Исем';
	@override String get save => 'Сакларга';
}

// Path: mangaChapterContents
class StringsMangaChapterContentsTt implements StringsMangaChapterContentsEn {
	StringsMangaChapterContentsTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String get episodeName => 'Эпизодның исеме';
	@override String get addImages => 'Сүрәтләрне өстәргә';
}

// Path: mangaList.episodesCount
class StringsMangaListEpisodesCountTt implements StringsMangaListEpisodesCountEn {
	StringsMangaListEpisodesCountTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tt'))(n,
		other: '${n} эпизод',
	);
}

// Path: mangaContents.episodeDefault
class StringsMangaContentsEpisodeDefaultTt implements StringsMangaContentsEpisodeDefaultEn {
	StringsMangaContentsEpisodeDefaultTt._(this._root);

	@override final StringsTt _root; // ignore: unused_field

	// Translations
	@override String episode({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tt'))(n,
		other: 'Эпизод ${n}',
	);
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'mangaList.library': return 'Library';
			case 'mangaList.episodesCount.episodes': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '1 episode',
				other: '${n} episodes',
			);
			case 'common.name': return 'Tatmanga';
			case 'common.stopEditing': return 'Stop editing';
			case 'common.edit': return 'Edit';
			case 'common.authorize': return 'Authorize';
			case 'common.manga': return 'Manga';
			case 'mangaContents.addAuthor': return 'Add an author';
			case 'mangaContents.name': return 'Name';
			case 'mangaContents.role': return 'Role';
			case 'mangaContents.addEpisode': return 'Add episode';
			case 'mangaContents.episodeDefault.episode': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				other: 'Episode ${n}',
			);
			case 'mangaContents.coverChange': return 'Change';
			case 'mangaContents.coverRemove': return 'Remove';
			case 'mangaContents.mangaDescription': return 'Description';
			case 'mangaContents.mangaTitle': return 'Title';
			case 'mangaContents.save': return 'Save';
			case 'mangaChapterContents.episodeName': return 'Episode name';
			case 'mangaChapterContents.addImages': return 'Add images';
			default: return null;
		}
	}
}

extension on StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'mangaList.library': return 'Библиотека';
			case 'mangaList.episodesCount.episodes': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
				one: '1 эпизод',
				few: '${n} эпизода',
				other: '${n} эпизодов',
			);
			case 'common.name': return 'Татманга';
			case 'common.stopEditing': return 'Завершить редактирование';
			case 'common.edit': return 'Редактировать';
			case 'common.authorize': return 'Авторизоваться';
			case 'common.manga': return 'Манга';
			case 'mangaContents.addAuthor': return 'Добавить автора';
			case 'mangaContents.name': return 'Имя';
			case 'mangaContents.role': return 'Роль';
			case 'mangaContents.addEpisode': return 'Добавить эпизод';
			case 'mangaContents.episodeDefault.episode': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
				other: 'Эпизод ${n}',
			);
			case 'mangaContents.coverChange': return 'Сменить';
			case 'mangaContents.coverRemove': return 'Удалить';
			case 'mangaContents.mangaDescription': return 'Описание';
			case 'mangaContents.mangaTitle': return 'Заголовок';
			case 'mangaContents.save': return 'Сохранить';
			case 'mangaChapterContents.episodeName': return 'Навание эпизода';
			case 'mangaChapterContents.addImages': return 'Добавить изображения';
			default: return null;
		}
	}
}

extension on StringsTt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'mangaList.library': return 'Мангаханә';
			case 'mangaList.episodesCount.episodes': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tt'))(n,
				other: '${n} эпизод',
			);
			case 'common.name': return 'Татманга';
			case 'common.stopEditing': return 'Үзгәртүне тәмамларга';
			case 'common.edit': return 'Үзгәртергә';
			case 'common.authorize': return 'Авторлаштырырга';
			case 'common.manga': return 'Манга';
			case 'mangaContents.addAuthor': return 'Авторны өстәргә';
			case 'mangaContents.name': return 'Исем';
			case 'mangaContents.role': return 'Роль';
			case 'mangaContents.addEpisode': return 'Эпизодны өстәргә';
			case 'mangaContents.episodeDefault.episode': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tt'))(n,
				other: 'Эпизод ${n}',
			);
			case 'mangaContents.coverChange': return 'Үзгәртергә';
			case 'mangaContents.coverRemove': return 'Ерагайтырга';
			case 'mangaContents.mangaDescription': return 'Тасвирлама';
			case 'mangaContents.mangaTitle': return 'Исем';
			case 'mangaContents.save': return 'Сакларга';
			case 'mangaChapterContents.episodeName': return 'Эпизодның исеме';
			case 'mangaChapterContents.addImages': return 'Сүрәтләрне өстәргә';
			default: return null;
		}
	}
}
