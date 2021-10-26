import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/shared/network/local/cache/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context)=>BlocProvider.of(context);

  bool? isDark;

  void getAppTheme(){
    isDark = CacheHelper.getData(key: 'isDark') ?? false;
    emit(AppGetTheme());
  }
  void changeAppTheme({required bool value}){
    isDark = value;
    CacheHelper.saveData(key: 'isDark', value: value);
    emit(AppChangeTheme());
  }
}
