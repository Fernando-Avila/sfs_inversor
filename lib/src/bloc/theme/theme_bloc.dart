import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeInitial> {
  ThemeBloc()
      : super(ThemeInitial(
            themeData: AppThemes.appThemeData[AppTheme.lightTheme]!)) {
    on<ThemeChangeEvent>((event, emit) =>
        emit(ThemeInitial(themeData: AppThemes.appThemeData[event.appTheme]!)));
  }
}
