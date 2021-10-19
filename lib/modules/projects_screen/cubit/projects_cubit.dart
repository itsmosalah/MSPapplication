import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/end_points/end_point.dart';
import 'package:msp_ainshams/data/models/project_model/project_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/data/shared/network/dio/dio_helper.dart';
import 'package:msp_ainshams/modules/projects_screen/specific_committee_screen/specific_committee_screen.dart';

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

  void getAllCommittees({
    required context,
  }) {
    emit(GetAllCommitteesWidgetLoading());
    for (int i = 0; i < committeesName.length; i++) {
      allCommitteesWidgets.add(
          buildCommitteeContainer(
              context: context,
              committeeName: committeesName[i],
              committeeImg: committeesImages[i],
            committeeColor: committeesColor[i],
            index:i,
          )
      );
    }
    emit(GetAllCommitteesWidgetSuccessfully());
  }

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

  Widget buildCommitteeContainer({
    required context,
    required String committeeName,
    required String committeeImg,
    required Color committeeColor,
    required int index,
  }) =>
      InkWell(
        onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificCommitteeScreen(
                model: getModel(index: index),
                committeeName: committeeName
               )
            ));
        },
        child: Container(
          width: 275.0,
          height: 100.0,
          decoration: BoxDecoration(
            color:committeeColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  committeeName,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    color: committeeName=="Web"?Colors.black:Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(committeeImg),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  List<ProjectModel> getModel({
  required int index
}){
    switch(index){
      case 1:
        return flutterProjects;
      case 2:
        return androidProjects;
      case 3:
        return machineLearningProjects;
      case  4:
        return securityProjects;
      case  5:
        return gameProjects;
      case 6:
        return webProjects;
      case 7:
        return dataScienceProjects;
      case  8:
        return testingProjects;
      default:
        return [];
    }
  }
}