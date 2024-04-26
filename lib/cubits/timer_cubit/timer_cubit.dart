import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gadwelha/models/note_model.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial(timerText: ''));
  List<Timer> countdownTimers = [];
  String timerText = '';
  late Timer countdownTimer;

  void startCountdown(DateTime scheduledTime, NoteModel note) async {
    final countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      final Duration difference = scheduledTime.difference(DateTime.now());
      if (difference.isNegative) {
        timer.cancel();
        // note.delete();
      } else {
        final int daysRemaining = difference.inDays;
        timerText =
            ' باقي ${daysRemaining.toString()} يوم و ${difference.inHours.remainder(24).toString().padLeft(2, '0')}:${difference.inMinutes.remainder(60).toString().padLeft(2, '0')}:${difference.inSeconds.remainder(60).toString().padLeft(2, '0')} ساعه ';
      }
    });
    emit(TimerInitial(timerText: timerText));
    countdownTimers.add(countdownTimer); // Add the new timer to the list
  }
}
