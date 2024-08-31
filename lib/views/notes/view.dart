import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/extensions/num.dart';
import 'package:notes_app/core/route_utils/route_utils.dart';
import 'package:notes_app/core/utils/colors.dart';
import 'package:notes_app/views/notes/cubit.dart';
import 'package:notes_app/views/notes/states.dart';
import 'package:notes_app/widgets/app_app_bar.dart';
import 'package:notes_app/widgets/app_text.dart';

import '../../widgets/app/note_card.dart';
import '../../widgets/app_loading_indicator.dart';
import '../add_note/view.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Notes App"),
      body: BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state) {
          final cubit = NotesCubit.of(context);
          final notes = cubit.notes;
          if (state is NotesLoading) {
            return AppLoadingIndicator();
          } else if (notes.isEmpty) {
            return Center(
              child: AppText(
                title: 'Start Adding your notes',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                onTap: () => RouteUtils.push(context, AddNoteView()),
              ),
            );
          }
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 110.height),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return NoteCard(
                note: note,
                onDelete: () => cubit.deleteNote(note),
                onTap: () => RouteUtils.push(context, AddNoteView(note: note)),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 12.height),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => RouteUtils.push(context, AddNoteView()),
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.white,
        child: Icon(FontAwesomeIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
