import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/models/crew_model/crew_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/crew_screen/cubit/crew_cubit.dart';
import 'package:msp_ainshams/modules/crew_screen/shared_widgets/shared_widgets.dart';
import 'package:msp_ainshams/modules/crew_screen/specific_crew_screen/specific_crew_screen.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CrewCubit, CrewState>(
      listener: (context, state) {},
      builder: (context, state) {
        CrewCubit model = CrewCubit.get(context);
        getAllCommittees(context: context,cubit:model);

        if (state is GetCrewFromServerLoading) {
          return customLoadingData(color: Colors.red);
        } else if (state is GetCrewFromServerError) {
          return getErrorFromServer(
            context: context,
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose Specific Committee',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                CarouselSlider(
                  items: model.allCommitteesWidgets,
                  options: CarouselOptions(
                    height: 100.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {

                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                verticalDivider(),

                Text(
                  "High board",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 25.0,
                ),

                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>crewContainer(
                        context: context,
                        model: model.highBoard[index],
                      ),
                      separatorBuilder: (context,index)=>verticalDivider(),
                      itemCount: model.highBoard.length),
                )

              ],
            ),
          );
        }
      },
    );
  }

  void getAllCommittees({
    required context,
    required  CrewCubit cubit,
  }) {
    cubit.allCommitteesWidgets = [];
    for (int i = 0; i < committeesName.length; i++) {
      cubit.allCommitteesWidgets.add(
          buildCommitteeContainer(
            context: context,
            committeeName: committeesName[i],
            committeeImg: committeesImages[i],
            committeeColor: committeesColor[i],
            index:i,
            model: cubit,
          )
      );
    }
  }

  List<CrewModel> getModel({
    required int index,
    required CrewCubit model
  }){
    switch(index){
      case 0:
        return model.flutterCrew;
      case 1:
        return model.androidCrew;
      case 2:
        return model.machineLearningCrew;
      case 3:
        return model.securityCrew;
      case 4:
        return model.gameCrew;
      case 5:
        return model.webCrew;
      case 6:
        return model.dataScienceCrew;
      case 7:
        return model.testingCrew;
      case 8:
        return model.prCrew;
      case 9:
        return model.hrCrew;
      case 10:
        return model.graphicCrew;
      default:
        return [];
    }
  }

  Widget buildCommitteeContainer({
    required context,
    required String committeeName,
    required String committeeImg,
    required Color committeeColor,
    required int index,
    required CrewCubit model,
  }) =>
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificCrewScreen(
              model: getModel(index: index, model: model),
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

}
