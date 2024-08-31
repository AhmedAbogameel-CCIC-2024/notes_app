import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.secondary,
      ),
    );
  }
}
