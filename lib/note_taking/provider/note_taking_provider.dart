import 'package:flutter/material.dart';
import 'package:provider_lesson/note_taking/local_storage/database_helper.dart';
import 'package:provider_lesson/note_taking/models/note_class.dart';

class NoteTakingProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get getNotes => _notes;
  DatabaseHelper _databaseHelper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void fetchNotes() async {
    final notesAsMaps = await _databaseHelper.fetchNotes();
    _notes = notesAsMaps
        .map((element) => Note(
            element['id'].toString(), element['title'], element['content']))
        .toList();
    notifyListeners();
  }

  void addNotes() {
    _databaseHelper.insertNote(titleController.text, contentController.text);
    titleController.clear();
    contentController.clear();
    fetchNotes();
  }

  void deleteNote(Note noteData) {
    _notes.removeWhere((note) => note.id == noteData.id);
    notifyListeners();
  }
}
