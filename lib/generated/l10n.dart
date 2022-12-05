// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Some localized strings:`
  String get pageHomeListTitle {
    return Intl.message(
      'Some localized strings:',
      name: 'pageHomeListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}`
  String pageHomeSamplePlaceholder(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeSamplePlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `My name is {lastName}, {firstName} {lastName}`
  String pageHomeSamplePlaceholdersOrdered(Object firstName, Object lastName) {
    return Intl.message(
      'My name is $lastName, $firstName $lastName',
      name: 'pageHomeSamplePlaceholdersOrdered',
      desc: '',
      args: [firstName, lastName],
    );
  }

  /// `{howMany, plural, one{You have 1 message} other{You have {howMany} messages}}`
  String pageHomeSamplePlural(int howMany) {
    return Intl.plural(
      howMany,
      one: 'You have 1 message',
      other: 'You have $howMany messages',
      name: 'pageHomeSamplePlural',
      desc: '',
      args: [howMany],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Simple Text next',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Texto simple Cancel',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: 'Simple Text Skip',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'Simple Text welcome',
      args: [],
    );
  }

  /// `Continue`
  String get continu {
    return Intl.message(
      'Continue',
      name: 'continu',
      desc: 'Simple Text continue',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: 'Texto simple Log in',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotpass {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotpass',
      desc: 'Texto simple Forgot your password?',
      args: [],
    );
  }

  /// `You do not have an account?`
  String get notaccount {
    return Intl.message(
      'You do not have an account?',
      name: 'notaccount',
      desc: 'Texto simple You do not have an account',
      args: [],
    );
  }

  /// `Sign up`
  String get singup {
    return Intl.message(
      'Sign up',
      name: 'singup',
      desc: 'Texto simple Sign up',
      args: [],
    );
  }

  /// `Email`
  String get mail {
    return Intl.message(
      'Email',
      name: 'mail',
      desc: 'Texto simple email',
      args: [],
    );
  }

  /// `FirstName`
  String get names {
    return Intl.message(
      'FirstName',
      name: 'names',
      desc: 'Texto simple correo inválido',
      args: [],
    );
  }

  /// `lastName`
  String get lastnames {
    return Intl.message(
      'lastName',
      name: 'lastnames',
      desc: 'Texto simple correo inválido',
      args: [],
    );
  }

  /// `Contact`
  String get phone {
    return Intl.message(
      'Contact',
      name: 'phone',
      desc: 'Texto simple Contact',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmpassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmpassword',
      desc: 'Texto simple Confirm Password',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get passworddontmatch {
    return Intl.message(
      'Passwords don\'t match',
      name: 'passworddontmatch',
      desc: 'Texto simple Passwords don\'t match ',
      args: [],
    );
  }

  /// `8 characters minimum`
  String get minimumpassword {
    return Intl.message(
      '8 characters minimum',
      name: 'minimumpassword',
      desc: 'Texto simple 8 characters minimum',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Texto simple Password',
      args: [],
    );
  }

  /// `Guest Account`
  String get accouninvited {
    return Intl.message(
      'Guest Account',
      name: 'accouninvited',
      desc: 'Texto simple Guest Account',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: 'Texto simple Or',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Texto simple Register',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: 'Texto simple Sign up',
      args: [],
    );
  }

  /// `Field required`
  String get fieldrequired {
    return Intl.message(
      'Field required',
      name: 'fieldrequired',
      desc: 'Texto simple Field required',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidmail',
      desc: 'Texto simple Invalid email',
      args: [],
    );
  }

  /// `Swipe to review the terms and conditions`
  String get swipeterms {
    return Intl.message(
      'Swipe to review the terms and conditions',
      name: 'swipeterms',
      desc: 'Texto simple Swipe to review the terms and conditions',
      args: [],
    );
  }

  /// `I have read and agree to the terms and conditions`
  String get acepttermsandconditions {
    return Intl.message(
      'I have read and agree to the terms and conditions',
      name: 'acepttermsandconditions',
      desc: 'Texto simple Revisar términos y condiciones',
      args: [],
    );
  }

  /// `Terms and conditions`
  String get termconditions {
    return Intl.message(
      'Terms and conditions',
      name: 'termconditions',
      desc: 'Texto simple Terms and conditions',
      args: [],
    );
  }

  /// `Already registered?`
  String get alreadyregistered {
    return Intl.message(
      'Already registered?',
      name: 'alreadyregistered',
      desc: 'Texto simple Already registered?',
      args: [],
    );
  }

  /// `Total: {total}`
  String pageHomeSampleTotalAmount(double total) {
    final NumberFormat totalNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(), symbol: '€', decimalDigits: 2);
    final String totalString = totalNumberFormat.format(total);

    return Intl.message(
      'Total: $totalString',
      name: 'pageHomeSampleTotalAmount',
      desc: '',
      args: [totalString],
    );
  }

  /// `Date: {date} Time: {time}`
  String pageHomeSampleCurrentDateTime(DateTime date, DateTime time) {
    final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    final DateFormat timeDateFormat = DateFormat.Hm(Intl.getCurrentLocale());
    final String timeString = timeDateFormat.format(time);

    return Intl.message(
      'Date: $dateString Time: $timeString',
      name: 'pageHomeSampleCurrentDateTime',
      desc: '',
      args: [dateString, timeString],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
