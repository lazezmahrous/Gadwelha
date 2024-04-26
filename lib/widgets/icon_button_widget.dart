// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gadwelha/cubits/theme_cubit/theme_cubit.dart';
import 'package:gadwelha/constanc.dart';
import 'package:gadwelha/themes/switch_mode.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({super.key, required this.icon, required this.onPressed});
  Widget? icon;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: Row(
        children: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              if (state is ThemeInitial) {
                if (state.initialTheme == ThemeClass.darkTheme) {
                  return IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: onPressed,
                    icon: icon!,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(Constanc.kColorblack),
                      backgroundColor:
                          MaterialStatePropertyAll(Constanc.kColorGray),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  );
                } else {
                  return IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: onPressed,
                    icon: icon!,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll(Constanc.kColorblack),
                      backgroundColor:
                          MaterialStatePropertyAll(Constanc.kColorGray),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  );
                }
              } else {
                return IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: onPressed,
                  icon: icon!,
                  style: const ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide(
                      color: Colors.black38,
                      width: 0.5,
                    )),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
