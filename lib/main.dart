import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/colors.dart';
import 'views/notes/cubit.dart';
import 'views/notes/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..getNotes(),
      child: ScreenUtilInit(
        designSize: Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          home: NotesView(),
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              color: AppColors.white,
              elevation: 0.0,
              shadowColor: AppColors.white,
              scrolledUnderElevation: 0,
            )
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child!,
          ),
        ),
      ),
    );
  }
}

