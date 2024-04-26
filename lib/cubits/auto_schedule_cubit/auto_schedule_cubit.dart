import 'package:bloc/bloc.dart';

import 'package:gadwelha/constanc.dart';

import 'package:gadwelha/models/schedule_model.dart';

import 'package:gadwelha/pages/auto_schedule.dart';

import 'package:hive/hive.dart';

import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';


part 'auto_schedule_state.dart';


class AutoScheduleCubit extends Cubit<AutoScheduleState> {

  AutoScheduleCubit() : super(AutoScheduleInitial());


  Future getDataSchedule() async {

    emit(AutoScheduleLoading());

    try {

      var notesBox = Hive.box<ScheduleModel>(Constanc.knoteBox);

      if (notesBox.isEmpty) {

        emit(AutoScheduleEmpty());

      } else {

        emit(AutoScheduleSuccess(

          notes: notesBox.values.toList(),

        ));

      }

    } catch (e) {

      emit(AutoScheduleError(message: e.toString()));

    }

  }


  Future addScheduleData({

    required ScheduleModel scheduleNote,

  }) async {

    emit(AutoScheduleAddNoteLoading());

    try {

      var noteBox = Hive.box<ScheduleModel>(Constanc.knoteBox);

      await noteBox.add(scheduleNote);

      emit(AutoScheduleAddNoteSuccess());

    } catch (e) {

      print(e.toString());

      emit(AutoScheduleAddNoteError(message: e.toString()));

    }

  }

}

