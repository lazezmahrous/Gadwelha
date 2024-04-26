part of 'get_notes_using_calendar_cubit.dart';


@immutable

sealed class GetNotesUsingCalendarState {}


final class GetNotesUsingCalendarInitial extends GetNotesUsingCalendarState {}


final class GetCalendarDateSuccess extends GetNotesUsingCalendarState {

  final DateTime date;


  GetCalendarDateSuccess({required this.date});

}


final class GetCalendarDateFailure extends GetNotesUsingCalendarState {}

