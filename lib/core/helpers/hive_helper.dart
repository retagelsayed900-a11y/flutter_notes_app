import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String noteBox = 'Note_Box';
  static const String noteKey = 'Note_Key';

  static List<String> myNotes = [];

  static Box get _box => Hive.box(noteBox);

  // Get all notes from Hive
  static Future<List<String>> getNotes() async {
    final dynamic storedNotes = _box.get(noteKey);

    if (storedNotes is List) {
      myNotes = storedNotes.map((note) => note.toString()).toList();
    } else {
      myNotes = [];
    }

    return List<String>.from(myNotes);
  }

  // Add a new note
  static Future<void> addNote(String text) async {
    myNotes = await getNotes();
    myNotes.add(text);

    await _box.put(noteKey, myNotes);
  }

  // Update an existing note
  static Future<void> updateNote(int index, String text) async {
    myNotes = await getNotes();

    if (index < 0 || index >= myNotes.length) {
      return;
    }

    myNotes[index] = text;
    await _box.put(noteKey, myNotes);
  }

  // Delete one note
  static Future<void> deleteNote(int index) async {
    myNotes = await getNotes();

    if (index < 0 || index >= myNotes.length) {
      return;
    }

    myNotes.removeAt(index);
    await _box.put(noteKey, myNotes);
  }

  // Delete all notes
  static Future<void> deleteAllNotes() async {
    myNotes = [];
    await _box.put(noteKey, myNotes);
  }
}