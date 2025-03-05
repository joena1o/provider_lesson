import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lesson/note_taking/provider/note_taking_provider.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key, required this.isEdit, this.id});

  final bool isEdit;
  final String? id;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NoteTakingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit == true ? "Edit Note" : "Add Note"),
        actions: [
          IconButton(
              onPressed: () {
                isEdit ? provider.updateNote(id) : provider.addNotes();
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: provider.titleController,
              decoration: InputDecoration(hintText: "Enter title here"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: provider.contentController,
              maxLines: 4,
              decoration: InputDecoration(hintText: "Enter comtent here"),
            ),
          )
        ],
      ),
    );
  }
}
