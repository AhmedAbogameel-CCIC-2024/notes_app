import 'package:flutter/material.dart';
import 'package:notes_app/core/datasources/notes.dart';
import 'package:notes_app/core/extensions/num.dart';
import 'package:notes_app/core/route_utils/route_utils.dart';
import 'package:notes_app/widgets/app_app_bar.dart';
import 'package:notes_app/widgets/app_button.dart';
import 'package:notes_app/widgets/app_text_field.dart';

import '../../core/models/note.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({Key? key, this.note}) : super(key: key);

  final Note? note;

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  TextEditingController noteTXController = TextEditingController();

  @override
  void initState() {
    noteTXController.text = widget.note?.note ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;
    return Scaffold(
      appBar: AppAppBar(title: isEditing ? "Edit Note" : "Add Note"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: AppTextField(
          hint: 'Enter note here',
          label: 'Note',
          maxLines: 8,
          controller: noteTXController,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: AppButton(
          title: isEditing ? 'Edit' : "Add",
          margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
          onTap: () {
            final note = noteTXController.text;
            if (note.isEmpty) {
              return;
            }
            if (isEditing) {
              NotesDatasource.instance.deleteNote(widget.note!);
            }
            NotesDatasource.instance.addNote(note);
            RouteUtils.pop(context, note);
          },
        ),
      ),
    );
  }
}
