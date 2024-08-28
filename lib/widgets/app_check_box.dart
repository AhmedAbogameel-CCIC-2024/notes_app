import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/extensions/num.dart';
import 'package:notes_app/core/utils/colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.width,
      height: 24.height,
      child: isSelected ? Icon(
        FontAwesomeIcons.check,
        color: AppColors.white,
        size: 16.height,
      ) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.radius),
        color: isSelected ? AppColors.primary : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.grey,
        ),
      ),
    );
  }
}
