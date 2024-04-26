import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gadwelha/models/note_model.dart';
import 'package:gadwelha/widgets/back_button.dart';
import 'package:gadwelha/widgets/icon_button_widget.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key, required this.note, required this.scheduledTime});
  final NoteModel note;
  final DateTime scheduledTime;
  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  List<Timer> countdownTimers = [];
  String timerTextAr = '';
  String timerTextEn = '';
  late Timer countdownTimer;

  void startCountdown(
      {required DateTime scheduledTime, required NoteModel note}) async {
    final countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      final Duration difference = scheduledTime.difference(DateTime.now());
      if (difference.isNegative) {
        timer.cancel();
        // note.delete();
      } else {
        final int daysRemaining = difference.inDays;
        timerTextAr =
            ' باقي ${daysRemaining.toString()} يوم و ${difference.inHours.remainder(24).toString().padLeft(2, '0')}:${difference.inMinutes.remainder(60).toString().padLeft(2, '0')}:${difference.inSeconds.remainder(60).toString().padLeft(2, '0')} ساعه ';
        setState(() {});
      }
    });

    countdownTimers.add(countdownTimer); // Add the new timer to the list
  }

  @override
  void dispose() {
    for (var timer in countdownTimers) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    startCountdown(note: widget.note, scheduledTime: widget.scheduledTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return timerTextAr.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.note.text),
              Text(
                timerTextAr,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          )
        : widget.note.difference.isNegative
            ? Center(
                child: Text('الموعد إنتهي'),
              )
            : Center(child: CircularProgressIndicator());
  }
}
