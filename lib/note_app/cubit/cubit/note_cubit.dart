import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/helpers/hive_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  // Load notes
  Future<void> getNotes() async {
    emit(NoteLoadingState());

    try {
      final notes = await HiveHelper.getNotes();
      _emitNotes(notes);
    } catch (e) {
      emit(NoteErrorState('Failed to load notes: $e'));
    }
  }

  // Add a note
  Future<void> addNote(String text) async {
    try {
      await HiveHelper.addNote(text);
      _emitNotes(HiveHelper.myNotes);
    } catch (e) {
      emit(NoteErrorState('Failed to add note: $e'));
    }
  }

  // Update a note
  Future<void> updateNote(int index, String text) async {
    try {
      await HiveHelper.updateNote(index, text);
      _emitNotes(HiveHelper.myNotes);
    } catch (e) {
      emit(NoteErrorState('Failed to update note: $e'));
    }
  }

  // Delete one note
  Future<void> deleteNote(int index) async {
    try {
      await HiveHelper.deleteNote(index);
      _emitNotes(HiveHelper.myNotes);
    } catch (e) {
      emit(NoteErrorState('Failed to delete note: $e'));
    }
  }

  // Delete all notes
  Future<void> clearAllNotes() async {
    try {
      await HiveHelper.deleteAllNotes();
      _emitNotes(HiveHelper.myNotes);
    } catch (e) {
      emit(NoteErrorState('Failed to clear notes: $e'));
    }
  }

  // Emit the correct state
  void _emitNotes(List<String> notes) {
    if (notes.isEmpty) {
      emit(NoteEmptyState());
    } else {
      emit(NoteSuccessState(notes: List<String>.from(notes)));
    }
  }
}
