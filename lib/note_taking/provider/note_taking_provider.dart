import 'package:flutter/material.dart';
import 'package:provider_lesson/note_taking/local_storage/database_helper.dart';
import 'package:provider_lesson/note_taking/models/note_class.dart';

class NoteTakingProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get getNotes => _notes;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void clearTextField() {
    titleController.clear();
    contentController.clear();
  }

  void setTheNoteValuesToTextField(Note noteData) {
    titleController.text = noteData.title;
    contentController.text = noteData.content;
    notifyListeners();
  }

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
    _databaseHelper.deleteNote(noteData.id);
    notifyListeners();
  }

  void updateNote(String? id) {
    if (id != null) {
      _databaseHelper.updateNote(
          id, titleController.text, contentController.text);
    }
  }
}
