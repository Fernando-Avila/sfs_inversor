part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeChangeEvent extends ThemeEvent {
  final AppTheme appTheme;
  ThemeChangeEvent({required this.appTheme});
  @override
  List<Object> get props => [appTheme];
}
