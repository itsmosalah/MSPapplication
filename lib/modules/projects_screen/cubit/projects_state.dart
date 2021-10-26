part of 'projects_cubit.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class GetProjectsFromServerLoading extends ProjectsState{}

class GetProjectsFromServerSuccessfully extends ProjectsState{}

class GetProjectsFromServerError extends ProjectsState{}