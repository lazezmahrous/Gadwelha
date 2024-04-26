import 'package:bloc/bloc.dart';

import 'package:gadwelha/constanc.dart';

import 'package:gadwelha/models/note_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:meta/meta.dart';


part 'add_notes_state.dart';


class AddNotesCubit extends Cubit<AddNotesState> {

  AddNotesCubit() : super(AddNotesInitial());


  Future<void> getNotes() async {

    emit(AddNotesGetNotesLoading());

    try {

      var notesBox = Hive.box<NoteModel>(Constanc.knoteBox);

      if (notesBox.isEmpty) {

        emit(AddNotesGetNotesIsEmpty());

      } else {

        emit(AddNotesGetNotesSuccess(

          notes: notesBox.values.toList(),

        ));

      }

    } catch (e) {

      emit(AddNotesGetNotesError(message: e.toString()));

    }

  }


  void addNote({

    required NoteModel note,

  }) async {

    emit(AddNotesGetNotesLoading());

    try {

      var noteBox = Hive.box<NoteModel>(Constanc.knoteBox);

      await noteBox.add(note);

      emit(AddNotesSuccees());

    } catch (e) {

      print(e.toString());

      emit(AddNotesError(message: e.toString()));

    }

  }

}

