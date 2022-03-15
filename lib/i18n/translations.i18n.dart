
/*
 * Generated file. Do not edit.
 *
 * Locales: 1
 * Strings: 31 
 *
 * Built on 2022-02-25 at 12:34 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.pt;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.pt) // set locale
/// - Locale locale = AppLocale.pt.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.pt) // locale check
enum AppLocale {
	pt, // 'pt' (base locale, fallback)
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
_TranslationsPt _t = _currLocale.translations;
_TranslationsPt get t => _t;

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
class Translations {
	Translations._(); // no constructor

	static _TranslationsPt of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _TranslationsPt _translationsPt = _TranslationsPt.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_TranslationsPt get translations {
		switch (this) {
			case AppLocale.pt: return _translationsPt;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.pt.build(); // build
	/// String a = t.my.path; // access
	_TranslationsPt build() {
		switch (this) {
			case AppLocale.pt: return _TranslationsPt.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.pt: return 'pt';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.pt: return const Locale.fromSubtags(languageCode: 'pt');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'pt': return AppLocale.pt;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _TranslationsPt translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _TranslationsPt {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsPt.build();

	// ignore: unused_field
	late final _TranslationsPt _root = this;

	// Translations
	late final _TranslationsAuthenticationPt authentication = _TranslationsAuthenticationPt._(_root);
	late final _TranslationsChatformPt chatform = _TranslationsChatformPt._(_root);
	late final _TranslationsSharedPt shared = _TranslationsSharedPt._(_root);
}

// Path: authentication
class _TranslationsAuthenticationPt {
	_TranslationsAuthenticationPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	late final _TranslationsAuthenticationLoginScreenPt loginScreen = _TranslationsAuthenticationLoginScreenPt._(_root);
	late final _TranslationsAuthenticationSignupScreenPt signupScreen = _TranslationsAuthenticationSignupScreenPt._(_root);
}

// Path: chatform
class _TranslationsChatformPt {
	_TranslationsChatformPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	late final _TranslationsChatformPopupsPt popups = _TranslationsChatformPopupsPt._(_root);
	late final _TranslationsChatformBottomSheetsPt bottomSheets = _TranslationsChatformBottomSheetsPt._(_root);
}

// Path: shared
class _TranslationsSharedPt {
	_TranslationsSharedPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get appName => 'Trizy';
	String get help => 'Ajuda';
	String get send => 'Enviar';
	String get whatsapp => 'WhatsApp';
	String get sms => 'Sms';
}

// Path: authentication.loginScreen
class _TranslationsAuthenticationLoginScreenPt {
	_TranslationsAuthenticationLoginScreenPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	late final _TranslationsAuthenticationLoginScreenHelperScreenPt helperScreen = _TranslationsAuthenticationLoginScreenHelperScreenPt._(_root);
}

// Path: authentication.signupScreen
class _TranslationsAuthenticationSignupScreenPt {
	_TranslationsAuthenticationSignupScreenPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get labelInitialScreen => 'É um prazer acompanhar você durante as viagens! Vamos lá?';
	String get btnNumber => 'Criar com o número do celular';
	String get btnGoogle => 'Criar com o Google';
	String get btnFace => 'Criar com o Facebook';
	String get labelHasAccount => 'Já possui uma conta?';
	String get btnLogin => 'ENTRAR';
}

// Path: chatform.popups
class _TranslationsChatformPopupsPt {
	_TranslationsChatformPopupsPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	late final _TranslationsChatformPopupsOnExitPt onExit = _TranslationsChatformPopupsOnExitPt._(_root);
	late final _TranslationsChatformPopupsResendAccessCodeConfirmationPt resendAccessCodeConfirmation = _TranslationsChatformPopupsResendAccessCodeConfirmationPt._(_root);
}

// Path: chatform.bottomSheets
class _TranslationsChatformBottomSheetsPt {
	_TranslationsChatformBottomSheetsPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	late final _TranslationsChatformBottomSheetsAccessCodePt accessCode = _TranslationsChatformBottomSheetsAccessCodePt._(_root);
	late final _TranslationsChatformBottomSheetsResendCodePt resendCode = _TranslationsChatformBottomSheetsResendCodePt._(_root);
}

// Path: authentication.loginScreen.helperScreen
class _TranslationsAuthenticationLoginScreenHelperScreenPt {
	_TranslationsAuthenticationLoginScreenHelperScreenPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get titleScreen => 'Está com **problemas** para **acessar** o **TRIZY**';
	String get summary => 'Você pode falar com a nossa equipe de atendimento e **solucionar o problema!**';
	String get description => '**Conte** para a gente **o que está acontecendo** e qual **o seu problema** com o **máximo de detalhes** que puder..';
	String get btn => 'IR PARA ATENDIMENTO';
}

// Path: chatform.popups.onExit
class _TranslationsChatformPopupsOnExitPt {
	_TranslationsChatformPopupsOnExitPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get title => 'Deseja realmente **sair**?';
	String get message => 'Você quer **sair do chat** e **voltar para a tela inicial** do aplicativo?';
	String get summary => '**Caso queira** apenas **alterar** alguma **informação**, aperte no **botão azul ao lado** da sua **mensagem.**';
	String get compactSummary => 'Você quer **sair do chat e voltar para a tela inicial** do aplicativo?';
	String get exit => 'Sair do chat';
	String get continueHere => 'Continuar aqui';
}

// Path: chatform.popups.resendAccessCodeConfirmation
class _TranslationsChatformPopupsResendAccessCodeConfirmationPt {
	_TranslationsChatformPopupsResendAccessCodeConfirmationPt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get title => '**Reenviamos** o código de acesso!';
	String get telMessage => 'O código de acesso foi reenviado para o celular: ';
	String get emailMessage => 'O código de acesso foi reenviado para o e-mail: ';
	String get telReminder => 'Lembre de checar as suas mensagens!';
	String get emailReminder => 'Lembre de chegar a caixa de spams!';
	String get confirmation => 'OK, entendi';
}

// Path: chatform.bottomSheets.accessCode
class _TranslationsChatformBottomSheetsAccessCodePt {
	_TranslationsChatformBottomSheetsAccessCodePt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get title => 'Digite o **código de acesso**';
}

// Path: chatform.bottomSheets.resendCode
class _TranslationsChatformBottomSheetsResendCodePt {
	_TranslationsChatformBottomSheetsResendCodePt._(this._root);

	// ignore: unused_field
	final _TranslationsPt _root;

	// Translations
	String get title => 'Por onde deseja **reenviar**?';
	String get whatsappSubtitle => 'Receber um acesso no meu WhatsApp.';
	String get smsSubtitle => 'Reenviar o código para o meu celular.';
}
