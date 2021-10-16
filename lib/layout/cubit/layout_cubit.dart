import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());


  static LayoutCubit get(context) => BlocProvider.of(context);

  late int currentIndex;


  void initialState(){
    currentIndex = 0;
  }

  void changeBottomNavigationBar({
  required int index,
}){
    currentIndex = index;
    emit(LayoutChangeBottomNavigationBar());
  }
}
