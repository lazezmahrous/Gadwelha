import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:gadwelha/Services/notifcations.dart';

import 'package:gadwelha/cubits/add_notes_cubit/add_notes_cubit.dart';

import 'package:gadwelha/cubits/get_notes_using_calendar_cubit/get_notes_using_calendar_cubit.dart';

import 'package:gadwelha/cubits/language_cubit/language_cubit.dart';

import 'package:gadwelha/cubits/theme_cubit/theme_cubit.dart';

import 'package:gadwelha/cubits/timer_cubit/timer_cubit.dart';

import 'package:gadwelha/constanc.dart';

import 'package:gadwelha/generated/l10n.dart';

import 'package:gadwelha/models/note_model.dart';

import 'package:gadwelha/models/schedule_model.dart';

import 'package:gadwelha/pages/splash_screen.dart';

import 'package:gadwelha/themes/switch_mode.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initializeNotification();

  await initializeDateFormatting('ar'); // تهيئة صيغة التاريخ باللغة العربية

  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(Constanc.knoteBox);

  Hive.registerAdapter(ScheduleModelAdapter());

  EasyLoading.init();

  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..backgroundColor = Colors.amber;

  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..getSavedTheme(),
        ),
        BlocProvider(
          create: (context) => AddNotesCubit()..getNotes(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) =>
              GetNotesUsingCalendarCubit()..getNotes(date: DateTime.now()),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              if (languageState is LanguageSaved &&
                  themeState is ThemeInitial) {
                return MaterialApp(
                  builder: EasyLoading.init(),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: languageState.locale,
                  title: 'جدولها',
                  theme: themeState.initialTheme,
                  home: const SplashScreen(),
                );
              } else {
                return MaterialApp(
                  builder: EasyLoading.init(),
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: const Locale('en'),
                  title: 'جدولها',
                  theme: ThemeClass.lightTheme,
                  home: const SplashScreen(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
