import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/models/project_model/project_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/projects_screen/cubit/projects_cubit.dart';
import 'package:msp_ainshams/modules/projects_screen/shared_widgets/shared_widgets.dart';
import 'package:msp_ainshams/modules/projects_screen/specific_committee_screen/specific_committee_screen.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectsCubit, ProjectsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProjectsCubit model = ProjectsCubit.get(context);
        getAllCommittees(context: context,cubit:model);

        if (state is GetProjectsFromServerLoading) {
          return customLoadingData(color: Colors.blueAccent);
        } else if (state is GetProjectsFromServerError) {
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
                  "All Projects",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 25.0,
                ),

                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>projectContainer(
                        context: context,
                        model: model.allProjects[index],
                      ),
                      separatorBuilder: (context,index)=>verticalDivider(),
                      itemCount: model.allProjects.length),
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
    required ProjectsCubit cubit,
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

  List<ProjectModel> getModel({
    required int index,
    required ProjectsCubit model
  }){
    switch(index){
      case 1:
        return model.flutterProjects;
      case 2:
        return model.androidProjects;
      case 3:
        return model.machineLearningProjects;
      case  4:
        return model.securityProjects;
      case  5:
        return model.gameProjects;
      case 6:
        return model.webProjects;
      case 7:
        return model.dataScienceProjects;
      case  8:
        return model.testingProjects;
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
    required ProjectsCubit model,
  }) =>
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecificCommitteeScreen(
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
