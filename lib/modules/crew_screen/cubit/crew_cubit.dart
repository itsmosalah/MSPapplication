import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:msp_ainshams/data/end_points/end_point.dart';
import 'package:msp_ainshams/data/models/crew_model/crew_model.dart';
import 'package:msp_ainshams/data/shared/network/dio/dio_helper.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  CrewCubit() : super(CrewInitial());


  static CrewCubit get(context)=>BlocProvider.of(context);

  List<Widget> allCommitteesWidgets = [];
  List<CrewModel> highBoard=[];
  /*List For each committee*/
  List<CrewModel>flutterCrew=[];
  List<CrewModel>androidCrew=[];
  List<CrewModel>dataScienceCrew=[];
  List<CrewModel>machineLearningCrew=[];
  List<CrewModel>webCrew=[];
  List<CrewModel>securityCrew=[];
  List<CrewModel>gameCrew=[];
  List<CrewModel>testingCrew=[];
  List<CrewModel>hrCrew=[];
  List<CrewModel>prCrew=[];
  List<CrewModel>graphicCrew=[];
  /**//////////////////////////////////


  void getCrewFromServer() {
    emit(GetCrewFromServerLoading());

    DioHelper.getData(
        type: crew
    ).then((value){
      value.data.forEach((element) {
        if (element["Committee"].toString().toLowerCase() == "flutter") {
          flutterCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() == "android") {
          androidCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() == "cyber security") {
          securityCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="data science"){
            dataScienceCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="game") {
          gameCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="softWare testing") {
          testingCrew.add(CrewModel.fromJson(element));
        }

        else if (element["Committee"].toString().toLowerCase() =="machine learning") {
          machineLearningCrew.add(CrewModel.fromJson(element));
        }

        else if (element["Committee"].toString().toLowerCase() =="web") {
          webCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="highboard") {
          highBoard.add(CrewModel.fromJson(element));
        }
        else if(element["Committee"].toString().toLowerCase() =="hr"){
            hrCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="pr&marketing") {
          prCrew.add(CrewModel.fromJson(element));
        }
        else if (element["Committee"].toString().toLowerCase() =="graphic&media") {
          graphicCrew.add(CrewModel.fromJson(element));
        }
      });
      emit(GetCrewFromServerSuccessfully());
    }).catchError((error){
      emit(GetCrewFromServerError());
    });

  }



}
