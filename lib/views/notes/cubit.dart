import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/notes/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/note.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInit());

  static NotesCubit of(context) => BlocProvider.of(context);

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
    emit(NotesInit());
  }

  Future<List<Note>> getNotes() async {
    emit(NotesLoading());
    await Future.delayed(Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonNotes = prefs.getStringList('notes') ?? [];
    notes = jsonNotes.map((e) => Note.fromJson(e)).toList();
    emit(NotesInit());
    return notes;
  }

  Future<void> deleteNote(Note value) async {
    notes.remove(value);
    _cacheCurrentNotes();
    emit(NotesInit());
  }

  Future<void> _cacheCurrentNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> convertedNotes = notes.map((e) => e.toJson()).toList();
    prefs.setStringList('notes', convertedNotes);
  }
}
