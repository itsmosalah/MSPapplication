import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/end_points/end_point.dart';
import 'package:msp_ainshams/data/models/event_model/event_model.dart';
import 'package:msp_ainshams/data/shared/network/dio/dio_helper.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());


  static EventsCubit  get(context)=>BlocProvider.of(context);

  List<EventModel> eventModel = [];

  void getAllEvents(){

    emit(EventLoadingDataFromServer());

    DioHelper.getData(
        type: events
    ).then((value){
      value.data.forEach((element){
        eventModel.add(EventModel.fromJson(element));
      });
      print(eventModel[0].name);
      emit(EventsGetDataSuccessFully());
    }).catchError((error){
      print(error);
      emit(EventsGetDataError());
    });
  }

}
