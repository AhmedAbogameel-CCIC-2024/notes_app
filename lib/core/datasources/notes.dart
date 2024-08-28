import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/note.dart';

class NotesDatasource {
  static final NotesDatasource instance = NotesDatasource();

  List<Note> notes = [];

  void addNote(String value) async {
    notes.insert(
      0,
      Note(
        note: value,
        createdAt: DateTime.now(),
      ),
    );
    _cacheCurrentNotes();
  }

  Future<List<Note>> getNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonNotes = prefs.getStringList('notes') ?? [];
    notes = jsonNotes.map((e) => Note.fromJson(e)).toList();
    return notes;
  }

  Future<void> deleteNote(Note value) async {
    notes.remove(value);
    _cacheCurrentNotes();
  }

  Future<void> _cacheCurrentNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> convertedNotes = notes.map((e) => e.toJson()).toList();
    prefs.setStringList('notes', convertedNotes);
  }
}