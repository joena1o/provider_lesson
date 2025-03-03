import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  //Initial SetUp for the database
  Future<Database> databaseInstance() async {
    return initDb();
  }

  Future<Database> initDb() async {
    String path = join(
      await getDatabasesPath(),
      'note.db',
    );
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY, title Text, content Text 
      )
''');
  }
  //Initial SetUp for the database

  ///Functions for Query
  Future<int> insertNote(title, content) async {
    Database database = await databaseInstance();
    return await database.insert('notes', {"title": title, "content": content});
  }

  Future<List<Map<String, dynamic>>> fetchNotes() async {
    Database database = await databaseInstance();
    return await database.query('notes');
  }
}
