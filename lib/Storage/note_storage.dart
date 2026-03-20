import 'package:shared_preferences/shared_preferences.dart';
import '../Model/note_model.dart';

class NoteStorage {
  static const String _notesKey = 'local_notes_key';

  static Future<List<NoteItem>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final rawList = prefs.getStringList(_notesKey) ?? [];

    return rawList.map((e) => NoteItem.fromJson(e)).toList();
  }

  static Future<void> saveNotes(List<NoteItem> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = notes.map((e) => e.toJson()).toList();
    await prefs.setStringList(_notesKey, encoded);
  }
}