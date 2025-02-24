import 'package:flutter/material.dart';

class NoteTakingProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _notes = [];
  List<Map<String, dynamic>> get getNotes => _notes;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNotes() {
    DateTime date = DateTime.now();
    Map<String, dynamic> note = {
      "id": date.toString(),
      "title": titleController.text,
      "content": contentController.text
    };
    _notes.add(note);
    titleController.clear();
    contentController.clear();
    notifyListeners();
  }
}
