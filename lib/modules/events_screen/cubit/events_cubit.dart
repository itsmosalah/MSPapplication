import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/models/event_model/event_model.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());


  List<EventModel> eventModel = [];

}
