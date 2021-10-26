part of 'crew_cubit.dart';

@immutable
abstract class CrewState {}

class CrewInitial extends CrewState {}
class GetCrewFromServerLoading extends CrewState {}
class GetCrewFromServerSuccessfully extends CrewState {}
class GetCrewFromServerError extends CrewState {}
