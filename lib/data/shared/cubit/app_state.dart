part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppChangeTheme extends AppState {}
class AppGetTheme extends AppState {}
