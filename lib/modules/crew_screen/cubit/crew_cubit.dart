import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  CrewCubit() : super(CrewInitial());
}
