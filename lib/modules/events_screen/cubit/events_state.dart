part of 'events_cubit.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsGetDataSuccessFully extends EventsState {}
class EventLoadingDataFromServer extends EventsState {}
class EventsGetDataError extends EventsState {}
