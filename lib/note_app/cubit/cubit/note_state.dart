part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoadingState extends NoteState {}

final class NoteSuccessState extends NoteState {
  final List<String> notes;

  NoteSuccessState({required this.notes});
}

final class NoteEmptyState extends NoteState {}

final class NoteErrorState extends NoteState {
  final String message;

  NoteErrorState(this.message);
}
