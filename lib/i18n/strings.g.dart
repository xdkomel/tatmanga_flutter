/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 84 (28 per locale)
///
/// Built on 2025-03-11 at 10:33 UTC

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
	ru(languageCode: 'ru', build: _StringsRu.build),
	tt(languageCode: 'tt', build: _StringsTt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
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
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

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
	late final _StringsMangaListEn mangaList = _StringsMangaListEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsMangaContentsEn mangaContents = _StringsMangaContentsEn._(_root);
	late final _StringsMangaChapterContentsEn mangaChapterContents = _StringsMangaChapterContentsEn._(_root);
	late final _StringsNotFoundEn notFound = _StringsNotFoundEn._(_root);
}

// Path: mangaList
class _StringsMangaListEn {
	_StringsMangaListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get library => 'Library';
	late final _StringsMangaListEpisodesCountEn episodesCount = _StringsMangaListEpisodesCountEn._(_root);
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Tatmanga';
	String get stopEditing => 'Stop editing';
	String get edit => 'Edit';
	String get authorize => 'Authorize';
	String get manga => 'Manga';
}

// Path: mangaContents
class _StringsMangaContentsEn {
	_StringsMangaContentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get addAuthor => 'Add an author';
	String get name => 'Name';
	String get role => 'Role';
	String get addEpisode => 'Add episode';
	late final _StringsMangaContentsEpisodeDefaultEn episodeDefault = _StringsMangaContentsEpisodeDefaultEn._(_root);
	String get coverUpload => 'Upload';
	String get coverRemove => 'Remove';
	String get mangaDescription => 'Description';
	String get mangaTitle => 'Title';
	String get save => 'Save';
	String get coverUrl => 'Cover URL';
}

// Path: mangaChapterContents
class _StringsMangaChapterContentsEn {
	_StringsMangaChapterContentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get episodeName => 'Episode name';
	String get addImages => 'Add images';
	String get imagesLoadingMethod => 'Images loading method';
	String get openLink => 'Open link';
	String get loadOneByOne => 'Load one by one';
	String get linkInputPlaceholder => 'Link URL';
	String get linkInputExplainText => 'When the episode opened, a redirect to the link will happen';
}

// Path: notFound
class _StringsNotFoundEn {
	_StringsNotFoundEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '404';
	String get body => 'Not found';
}

// Path: mangaList.episodesCount
class _StringsMangaListEpisodesCountEn {
	_StringsMangaListEpisodesCountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 episode',
		other: '${n} episodes',
	);
}

// Path: mangaContents.episodeDefault
class _StringsMangaContentsEpisodeDefaultEn {
	_StringsMangaContentsEpisodeDefaultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String episode({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		other: 'Episode ${n}',
	);
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsMangaListRu mangaList = _StringsMangaListRu._(_root);
	@override late final _StringsCommonRu common = _StringsCommonRu._(_root);
	@override late final _StringsMangaContentsRu mangaContents = _StringsMangaContentsRu._(_root);
	@override late final _StringsMangaChapterContentsRu mangaChapterContents = _StringsMangaChapterContentsRu._(_root);
	@override late final _StringsNotFoundRu notFound = _StringsNotFoundRu._(_root);
}

// Path: mangaList
class _StringsMangaListRu implements _StringsMangaListEn {
	_StringsMangaListRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get library => 'Библиотека';
	@override late final _StringsMangaListEpisodesCountRu episodesCount = _StringsMangaListEpisodesCountRu._(_root);
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
	_StringsCommonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get name => 'Татманга';
	@override String get stopEditing => 'Завершить редактирование';
	@override String get edit => 'Редактировать';
	@override String get authorize => 'Авторизоваться';
	@override String get manga => 'Манга';
}

// Path: mangaContents
class _StringsMangaContentsRu implements _StringsMangaContentsEn {
	_StringsMangaContentsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get addAuthor => 'Добавить автора';
	@override String get name => 'Имя';
	@override String get role => 'Роль';
	@override String get addEpisode => 'Добавить эпизод';
	@override late final _StringsMangaContentsEpisodeDefaultRu episodeDefault = _StringsMangaContentsEpisodeDefaultRu._(_root);
	@override String get coverUpload => 'Загрузить';
	@override String get coverRemove => 'Удалить';
	@override String get mangaDescription => 'Описание';
	@override String get mangaTitle => 'Заголовок';
	@override String get save => 'Сохранить';
	@override String get coverUrl => 'Ссылка на обложку';
}

// Path: mangaChapterContents
class _StringsMangaChapterContentsRu implements _StringsMangaChapterContentsEn {
	_StringsMangaChapterContentsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get episodeName => 'Навание эпизода';
	@override String get addImages => 'Добавить изображения';
	@override String get imagesLoadingMethod => 'Способ заргузки изображений';
	@override String get openLink => 'Открыть ссылку';
	@override String get loadOneByOne => 'Загрузить по одному';
	@override String get linkInputPlaceholder => 'Ссылка';
	@override String get linkInputExplainText => 'При открытии эпизода произойдёт автоматический переход по ссылке';
}

// Path: notFound
class _StringsNotFoundRu implements _StringsNotFoundEn {
	_StringsNotFoundRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '404';
	@override String get body => 'Не найдено';
}

// Path: mangaList.episodesCount
class _StringsMangaListEpisodesCountRu implements _StringsMangaListEpisodesCountEn {
	_StringsMangaListEpisodesCountRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		one: '1 эпизод',
		few: '${n} эпизода',
		other: '${n} эпизодов',
	);
}

// Path: mangaContents.episodeDefault
class _StringsMangaContentsEpisodeDefaultRu implements _StringsMangaContentsEpisodeDefaultEn {
	_StringsMangaContentsEpisodeDefaultRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String episode({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		other: 'Эпизод ${n}',
	);
}

// Path: <root>
class _StringsTt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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

	@override late final _StringsTt _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsMangaListTt mangaList = _StringsMangaListTt._(_root);
	@override late final _StringsCommonTt common = _StringsCommonTt._(_root);
	@override late final _StringsMangaContentsTt mangaContents = _StringsMangaContentsTt._(_root);
	@override late final _StringsMangaChapterContentsTt mangaChapterContents = _StringsMangaChapterContentsTt._(_root);
	@override late final _StringsNotFoundTt notFound = _StringsNotFoundTt._(_root);
}

// Path: mangaList
class _StringsMangaListTt implements _StringsMangaListEn {
	_StringsMangaListTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String get library => 'Мангаханә';
	@override late final _StringsMangaListEpisodesCountTt episodesCount = _StringsMangaListEpisodesCountTt._(_root);
}

// Path: common
class _StringsCommonTt implements _StringsCommonEn {
	_StringsCommonTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String get name => 'Татманга';
	@override String get stopEditing => 'Үзгәртүне тәмамларга';
	@override String get edit => 'Үзгәртергә';
	@override String get authorize => 'Авторлаштырырга';
	@override String get manga => 'Манга';
}

// Path: mangaContents
class _StringsMangaContentsTt implements _StringsMangaContentsEn {
	_StringsMangaContentsTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String get addAuthor => 'Авторны өстәргә';
	@override String get name => 'Исем';
	@override String get role => 'Роль';
	@override String get addEpisode => 'Эпизодны өстәргә';
	@override late final _StringsMangaContentsEpisodeDefaultTt episodeDefault = _StringsMangaContentsEpisodeDefaultTt._(_root);
	@override String get coverUpload => 'Бушатырга';
	@override String get coverRemove => 'Ерагайтырга';
	@override String get mangaDescription => 'Тасвирлама';
	@override String get mangaTitle => 'Исем';
	@override String get save => 'Сакларга';
	@override String get coverUrl => 'Тышлыкка сылтама';
}

// Path: mangaChapterContents
class _StringsMangaChapterContentsTt implements _StringsMangaChapterContentsEn {
	_StringsMangaChapterContentsTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String get episodeName => 'Эпизодның исеме';
	@override String get addImages => 'Сурәтләрне өстәргә';
	@override String get imagesLoadingMethod => 'Сурәтләрне йөкләү ысулы';
	@override String get openLink => 'Сылтаманы ачырга';
	@override String get loadOneByOne => 'Берәм-берәм йөкләргә';
	@override String get linkInputPlaceholder => 'Сылтама';
	@override String get linkInputExplainText => 'Эпизод ачылганда сылтама буенча автоматик күчү булачак';
}

// Path: notFound
class _StringsNotFoundTt implements _StringsNotFoundEn {
	_StringsNotFoundTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String get title => '404';
	@override String get body => 'Табылмаган';
}

// Path: mangaList.episodesCount
class _StringsMangaListEpisodesCountTt implements _StringsMangaListEpisodesCountEn {
	_StringsMangaListEpisodesCountTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

	// Translations
	@override String episodes({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tt'))(n,
		other: '${n} эпизод',
	);
}

// Path: mangaContents.episodeDefault
class _StringsMangaContentsEpisodeDefaultTt implements _StringsMangaContentsEpisodeDefaultEn {
	_StringsMangaContentsEpisodeDefaultTt._(this._root);

	@override final _StringsTt _root; // ignore: unused_field

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
			case 'mangaContents.coverUpload': return 'Upload';
			case 'mangaContents.coverRemove': return 'Remove';
			case 'mangaContents.mangaDescription': return 'Description';
			case 'mangaContents.mangaTitle': return 'Title';
			case 'mangaContents.save': return 'Save';
			case 'mangaContents.coverUrl': return 'Cover URL';
			case 'mangaChapterContents.episodeName': return 'Episode name';
			case 'mangaChapterContents.addImages': return 'Add images';
			case 'mangaChapterContents.imagesLoadingMethod': return 'Images loading method';
			case 'mangaChapterContents.openLink': return 'Open link';
			case 'mangaChapterContents.loadOneByOne': return 'Load one by one';
			case 'mangaChapterContents.linkInputPlaceholder': return 'Link URL';
			case 'mangaChapterContents.linkInputExplainText': return 'When the episode opened, a redirect to the link will happen';
			case 'notFound.title': return '404';
			case 'notFound.body': return 'Not found';
			default: return null;
		}
	}
}

extension on _StringsRu {
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
			case 'mangaContents.coverUpload': return 'Загрузить';
			case 'mangaContents.coverRemove': return 'Удалить';
			case 'mangaContents.mangaDescription': return 'Описание';
			case 'mangaContents.mangaTitle': return 'Заголовок';
			case 'mangaContents.save': return 'Сохранить';
			case 'mangaContents.coverUrl': return 'Ссылка на обложку';
			case 'mangaChapterContents.episodeName': return 'Навание эпизода';
			case 'mangaChapterContents.addImages': return 'Добавить изображения';
			case 'mangaChapterContents.imagesLoadingMethod': return 'Способ заргузки изображений';
			case 'mangaChapterContents.openLink': return 'Открыть ссылку';
			case 'mangaChapterContents.loadOneByOne': return 'Загрузить по одному';
			case 'mangaChapterContents.linkInputPlaceholder': return 'Ссылка';
			case 'mangaChapterContents.linkInputExplainText': return 'При открытии эпизода произойдёт автоматический переход по ссылке';
			case 'notFound.title': return '404';
			case 'notFound.body': return 'Не найдено';
			default: return null;
		}
	}
}

extension on _StringsTt {
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
			case 'mangaContents.coverUpload': return 'Бушатырга';
			case 'mangaContents.coverRemove': return 'Ерагайтырга';
			case 'mangaContents.mangaDescription': return 'Тасвирлама';
			case 'mangaContents.mangaTitle': return 'Исем';
			case 'mangaContents.save': return 'Сакларга';
			case 'mangaContents.coverUrl': return 'Тышлыкка сылтама';
			case 'mangaChapterContents.episodeName': return 'Эпизодның исеме';
			case 'mangaChapterContents.addImages': return 'Сурәтләрне өстәргә';
			case 'mangaChapterContents.imagesLoadingMethod': return 'Сурәтләрне йөкләү ысулы';
			case 'mangaChapterContents.openLink': return 'Сылтаманы ачырга';
			case 'mangaChapterContents.loadOneByOne': return 'Берәм-берәм йөкләргә';
			case 'mangaChapterContents.linkInputPlaceholder': return 'Сылтама';
			case 'mangaChapterContents.linkInputExplainText': return 'Эпизод ачылганда сылтама буенча автоматик күчү булачак';
			case 'notFound.title': return '404';
			case 'notFound.body': return 'Табылмаган';
			default: return null;
		}
	}
}
