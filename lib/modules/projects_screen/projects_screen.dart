import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/projects_screen/cubit/projects_cubit.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectsCubit, ProjectsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProjectsCubit model = ProjectsCubit.get(context);
        model.getAllCommittees(context: context);

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
                verticalDivider(),

                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      projectPhoto(
                        imageUrl:model.allProjects[0].photo
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
  Widget projectPhoto({required String imageUrl}) => Container(
    width: 150,
    height: 150,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Image(
      image: NetworkImage(imageUrl),
      errorBuilder: (context, object, stackTrace) {
        return Image.asset("assets/images/MSP LOGO WHITE.png");
      },
      fit: BoxFit.cover,
    ),
  );

}
