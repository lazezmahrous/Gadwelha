import 'package:flutter/material.dart';
import 'package:gadwelha/constanc.dart';

class Kbutton extends StatelessWidget {
  Kbutton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.lable});
  VoidCallback? onPressed;
  Widget? icon;
  Widget? lable;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Constanc.kColorWhite),
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)))),
        fixedSize: const MaterialStatePropertyAll(
          Size(10, 30),
        ),
      ),
      onPressed: () async {},
      icon: icon!,
      label: lable!,
    );
  }
}
