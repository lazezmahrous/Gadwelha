part of 'auto_schedule_cubit.dart';

@immutable
sealed class AutoScheduleState {}

final class AutoScheduleInitial extends AutoScheduleState {}

final class AutoScheduleLoading extends AutoScheduleState {}

final class AutoScheduleAddNoteLoading extends AutoScheduleState {}

final class AutoScheduleEmpty extends AutoScheduleState {}

final class AutoScheduleAddNoteEmpty extends AutoScheduleState {}

final class AutoScheduleSuccess extends AutoScheduleState {
  final List<ScheduleModel> notes;
  AutoScheduleSuccess({required this.notes});
}

final class AutoScheduleAddNoteSuccess extends AutoScheduleState {}

final class AutoScheduleError extends AutoScheduleState {
  final String message;
  AutoScheduleError({required this.message});
}

final class AutoScheduleAddNoteError extends AutoScheduleState {
  final String message;
  AutoScheduleAddNoteError({required this.message});
}
