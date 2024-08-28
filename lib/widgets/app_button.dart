import 'package:flutter/material.dart';
import 'package:notes_app/core/extensions/num.dart';

import '../core/utils/colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.onTap,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 56.height,
          alignment: Alignment.center,
          child: AppText(
            title: title,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16.radius),
          ),
        ),
      ),
    );
  }
}
