import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gadwelha/cubits/language_cubit/language_cubit.dart';
import 'package:gadwelha/cubits/theme_cubit/theme_cubit.dart';
import 'package:gadwelha/generated/l10n.dart';
import 'package:gadwelha/widgets/card_widget.dart';
import 'package:gadwelha/widgets/icon_button_widget.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    BlocProvider.of<ThemeCubit>(context).getSavedTheme();
    super.initState();
  }

  String? theme;

  @override
  Widget build(BuildContext context) {
    final changeLanguage = BlocProvider.of<LanguageCubit>(context);
    final changeTheme = BlocProvider.of<ThemeCubit>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButtonWidget(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            CardWidget(
              text: S.of(context).theme,
              child: PopupMenuButton(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (newValue) {
                  if (newValue == 0) {
                    changeTheme.changeTheme('dark');
                  } else {
                    changeTheme.changeTheme('light');
                  }
                  setState(() {});
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(S.of(context).darkTheme),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(S.of(context).lightTheme),
                  ),
                ],
              ),
            ),
            // CardWidget(
            //   text: S.of(context).theme,
            //   child: IconButton(
            //     onPressed: () async {
            //       final prefs = await SharedPreferences.getInstance();
            //       final savedTheme = prefs.getString('theme');
            //       if (savedTheme == 'light') {
            //         changeTheme.changeTheme('dark');
            //       } else {
            //         changeTheme.changeTheme('light');
            //       }
            //     },
            //     icon: BlocListener<ThemeCubit, ThemeState>(
            //       listener: (context, state) {
            //         if (state is SavedTheme) {
            //           theme = state.savedTheme;
            //           setState(() {});
            //         }
            //       },
            //       child: Icon(
            //           theme == 'light' ? Icons.dark_mode : Icons.light_mode),
            //     ),
            //   ),
            // ),
            CardWidget(
              text: S.of(context).language,
              child: PopupMenuButton(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (newValue) {
                  if (newValue == 0) {
                    changeLanguage.changeLanguage('ar');
                  } else {
                    changeLanguage.changeLanguage('en');
                  }
                  setState(() {});
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(S.of(context).arLanguage),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(S.of(context).enLanguage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
