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

  /// `Gadwelha`
  String get appName {
    return Intl.message(
      'Gadwelha',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `What do we have today?`
  String get addNoteLable {
    return Intl.message(
      'What do we have today?',
      name: 'addNoteLable',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get addNoteEror {
    return Intl.message(
      'Field is required',
      name: 'addNoteEror',
      desc: '',
      args: [],
    );
  }

  /// `Schedule the task`
  String get addNoteButton {
    return Intl.message(
      'Schedule the task',
      name: 'addNoteButton',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arLanguage {
    return Intl.message(
      'Arabic',
      name: 'arLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get enLanguage {
    return Intl.message(
      'English',
      name: 'enLanguage',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Message Content`
  String get messageLable {
    return Intl.message(
      'Message Content',
      name: 'messageLable',
      desc: '',
      args: [],
    );
  }

  /// `Repeat alert`
  String get repeatAlert {
    return Intl.message(
      'Repeat alert',
      name: 'repeatAlert',
      desc: '',
      args: [],
    );
  }

  /// `When you choose the alert on Friday at 1 o’clock and activate this option, you will receive the notification every Friday at 1`
  String get repeatHint {
    return Intl.message(
      'When you choose the alert on Friday at 1 o’clock and activate this option, you will receive the notification every Friday at 1',
      name: 'repeatHint',
      desc: '',
      args: [],
    );
  }

  /// `Scheduling`
  String get schedulingButton {
    return Intl.message(
      'Scheduling',
      name: 'schedulingButton',
      desc: '',
      args: [],
    );
  }

  /// `The task has been scheduled successfully !`
  String get schedulingSuccess {
    return Intl.message(
      'The task has been scheduled successfully !',
      name: 'schedulingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Date error`
  String get schedulingError {
    return Intl.message(
      'Date error',
      name: 'schedulingError',
      desc: '',
      args: [],
    );
  }

  /// `Eye Safety Alert`
  String get eyeSafetyAlert {
    return Intl.message(
      'Eye Safety Alert',
      name: 'eyeSafetyAlert',
      desc: '',
      args: [],
    );
  }

  /// `For eye comfort, you need to apply the 20-20 rule, whereby you sit for 20 minutes in front of the computer and then look at anything far away from you for 20 seconds. When you activate this option, the application will send you a notification every 20 minutes to look away from the computer screen.`
  String get eyeSafetyAlertDescription {
    return Intl.message(
      'For eye comfort, you need to apply the 20-20 rule, whereby you sit for 20 minutes in front of the computer and then look at anything far away from you for 20 seconds. When you activate this option, the application will send you a notification every 20 minutes to look away from the computer screen.',
      name: 'eyeSafetyAlertDescription',
      desc: '',
      args: [],
    );
  }

  /// `Back Vertebrae Safety Alerts`
  String get backVertebraeSafetyAlerts {
    return Intl.message(
      'Back Vertebrae Safety Alerts',
      name: 'backVertebraeSafetyAlerts',
      desc: '',
      args: [],
    );
  }

  /// `To rest the back vertebrae, you must take a break for at least 10 minutes every hour of sitting. When you activate this option, the program will send you a notification to take a break for 10 minutes every hour.`
  String get backVertebraeSafetyAlertsDescription {
    return Intl.message(
      'To rest the back vertebrae, you must take a break for at least 10 minutes every hour of sitting. When you activate this option, the program will send you a notification to take a break for 10 minutes every hour.',
      name: 'backVertebraeSafetyAlertsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Well, we're done`
  String get messageForSuccess {
    return Intl.message(
      'Well, we\'re done',
      name: 'messageForSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Gadwelha Say`
  String get notifcationHead {
    return Intl.message(
      'Gadwelha Say',
      name: 'notifcationHead',
      desc: '',
      args: [],
    );
  }

  /// `For the safety of the back vertebrae, you need to rest for 10 minutes`
  String get backVertebraeSafetyAlertsNotifcation {
    return Intl.message(
      'For the safety of the back vertebrae, you need to rest for 10 minutes',
      name: 'backVertebraeSafetyAlertsNotifcation',
      desc: '',
      args: [],
    );
  }

  /// `For the safety of your eyes, you need to focus on an object far away from you for 20 seconds`
  String get eyeSafetyAlertNotifcation {
    return Intl.message(
      'For the safety of your eyes, you need to focus on an object far away from you for 20 seconds',
      name: 'eyeSafetyAlertNotifcation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task ?`
  String get alertDialogTitle {
    return Intl.message(
      'Are you sure you want to delete this task ?',
      name: 'alertDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get alertDialogOptionOne {
    return Intl.message(
      'Yes',
      name: 'alertDialogOptionOne',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get alertDialogOptionTow {
    return Intl.message(
      'No',
      name: 'alertDialogOptionTow',
      desc: '',
      args: [],
    );
  }

  /// `Start a countdown for this task`
  String get startCountDowen {
    return Intl.message(
      'Start a countdown for this task',
      name: 'startCountDowen',
      desc: '',
      args: [],
    );
  }

  /// `Time is over`
  String get timeIsOver {
    return Intl.message(
      'Time is over',
      name: 'timeIsOver',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
