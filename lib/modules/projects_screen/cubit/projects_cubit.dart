import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/end_points/end_point.dart';
import 'package:msp_ainshams/data/models/project_model/project_model.dart';
import 'package:msp_ainshams/data/shared/network/dio/dio_helper.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());

  static ProjectsCubit get(context)=>BlocProvider.of(context);

  List<Widget> allCommitteesWidgets = [];
  List<ProjectModel> allProjects=[];
  /*List For each committee*/
  List<ProjectModel>flutterProjects=[];
  List<ProjectModel>androidProjects=[];
  List<ProjectModel>dataScienceProjects=[];
  List<ProjectModel>machineLearningProjects=[];
  List<ProjectModel>webProjects=[];
  List<ProjectModel>securityProjects=[];
  List<ProjectModel>gameProjects=[];
  List<ProjectModel>testingProjects=[];
  /**//////////////////////////////////


  void getProjectsFromServer() {
    emit(GetProjectsFromServerLoading());

    DioHelper.getData(
        type: projects
    ).then((value){
      value.data.forEach((element){
        allProjects.add(ProjectModel.fromJson(element));
        switch(element["team"]){
          case "Flutter":
            flutterProjects.add(ProjectModel.fromJson(element));
            break;
          case "Android":
            androidProjects.add(ProjectModel.fromJson(element));
            break;
          case "Cyber Security":
            securityProjects.add(ProjectModel.fromJson(element));
            break;
          case "Data Science":
            dataScienceProjects.add(ProjectModel.fromJson(element));
            break;
          case "Game":
            gameProjects.add(ProjectModel.fromJson(element));
            break;
          case "SoftWare Testing":
            testingProjects.add(ProjectModel.fromJson(element));
            break;
          case "Machine Learning":
            machineLearningProjects.add(ProjectModel.fromJson(element));
            break;
          case "Web":
            webProjects.add(ProjectModel.fromJson(element));
            break;
        }
      });
      emit(GetProjectsFromServerSuccessfully());
    }).catchError((error){
      emit(GetProjectsFromServerError());
    });

  }



}