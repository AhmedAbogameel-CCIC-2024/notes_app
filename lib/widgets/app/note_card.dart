import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/extensions/num.dart';
import 'package:notes_app/widgets/app_text.dart';

import '../../core/models/note.dart';
import '../../core/utils/colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.onTap,
  }) : super(key: key);

  final Note note;
  final void Function() onDelete;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.width,
          vertical: 16.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppText(
                    title: note.note,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: onDelete,
                  child: Icon(
                    FontAwesomeIcons.trashCan,
                    color: AppColors.red,
                    size: 20.height,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.height),
            AppText(
              title: '${DateFormat.jm().format(note.createdAt)}',
              fontSize: 12.font,
              color: AppColors.grey,
            ),
            AppText(
              title: '${DateFormat.yMd().format(note.createdAt)}',
              fontSize: 12.font,
              color: AppColors.grey,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
