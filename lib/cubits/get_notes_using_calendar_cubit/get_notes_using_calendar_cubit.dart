import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';


part 'get_notes_using_calendar_state.dart';


class GetNotesUsingCalendarCubit extends Cubit<GetNotesUsingCalendarState> {

  GetNotesUsingCalendarCubit() : super(GetNotesUsingCalendarInitial());


  Future<void> getNotes({required DateTime date}) async {

    emit(GetCalendarDateSuccess(date: date));

  }

}

