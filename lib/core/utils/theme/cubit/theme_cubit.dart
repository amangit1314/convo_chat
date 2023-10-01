
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'dart:developer';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      emit(ThemeData.dark());
      log('Switched to dark theme');
    } else {
      emit(ThemeData.light());
      log('Switched to light theme');
    }
  }
}
