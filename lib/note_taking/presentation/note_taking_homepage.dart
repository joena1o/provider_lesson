import 'package:flutter/material.dart';
import 'package:provider_lesson/note_taking/presentation/note_taking_add_note.dart';
import 'package:provider_lesson/note_taking/provider/note_taking_provider.dart';
import 'package:provider/provider.dart';

class NoteTakingHomePage extends StatelessWidget {
  const NoteTakingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NoteTakingProvider>().fetchNotes();
    final userNotes = context.watch<NoteTakingProvider>().getNotes;
    final provider = context.read<NoteTakingProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Note Taking App"),
      ),
      body: ListView.builder(
          itemCount: userNotes.length,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              title: Text(userNotes[index].title),
              subtitle: Text(userNotes[index].content),
              trailing: IconButton(
                  onPressed: () {
                    provider.deleteNote(userNotes[index]);
                  },
                  icon: const Icon(Icons.delete)),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddNote()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
