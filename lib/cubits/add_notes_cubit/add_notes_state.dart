part of 'add_notes_cubit.dart';

@immutable
sealed class AddNotesState {}

final class AddNotesInitial extends AddNotesState {}

final class AddNotesLoading extends AddNotesState {}

final class AddNotesSuccees extends AddNotesState {}

final class AddNotesError extends AddNotesState {
  final String message;
  AddNotesError({required this.message});
}

final class AddNotesGetNotesLoading extends AddNotesState {}

final class AddNotesGetNotesIsEmpty extends AddNotesState {}

final class AddNotesGetNotesSuccess extends AddNotesState {
  final List<NoteModel> notes;
  AddNotesGetNotesSuccess({required this.notes});
}

final class AddNotesGetNotesError extends AddNotesState {
  final String message;
  AddNotesGetNotesError({required this.message});
}
