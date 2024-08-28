import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/extensions/num.dart';
import 'package:notes_app/core/route_utils/route_utils.dart';
import 'package:notes_app/core/utils/colors.dart';
import 'package:notes_app/widgets/app_app_bar.dart';

import '../../core/datasources/notes.dart';
import '../../widgets/app/note_card.dart';
import '../add_note/view.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getNotes() async {
    await NotesDatasource.instance.getNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final datasource = NotesDatasource.instance;
    final notes = datasource.notes;
    return Scaffold(
      appBar: AppAppBar(title: "Notes App"),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 110.height),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final  note = notes[index];
          return NoteCard(
            note: note,
            onDelete: () {
              datasource.deleteNote(note);
              setState(() {});
            },
            onTap: () async {
              await RouteUtils.push(context, AddNoteView(note: note));
              setState(() {});
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12.height),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await RouteUtils.push(context, AddNoteView());
          if (result != null) {
            setState(() {});
          }
        },
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        child: Icon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
