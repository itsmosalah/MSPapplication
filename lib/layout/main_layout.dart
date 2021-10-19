import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/layout/cubit/layout_state.dart';
import 'package:msp_ainshams/modules/events_screen/cubit/events_cubit.dart';
import 'package:msp_ainshams/modules/projects_screen/cubit/projects_cubit.dart';

import 'cubit/layout_cubit.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LayoutCubit()),
        BlocProvider(create: (context)=>EventsCubit()..getAllEvents()),
        BlocProvider(create: (context)=>ProjectsCubit()..getProjectsFromServer())
    ],
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          LayoutCubit model = LayoutCubit.get(context);

          int indexOfBottomNavBar = model.currentIndex;

          return Scaffold(
            appBar: AppBar(
              titleSpacing: 20.0,
              title: customTitle(
                model: model,
              ),
              elevation: 0.0,
            ),
            bottomNavigationBar: customBottomNavBar(
                index: indexOfBottomNavBar, //get the index
                function: (int index) {
                  model.changeBottomNavigationBar(index: index); //function to change the index of bottom navigation bar
                }),
            body: screens[indexOfBottomNavBar],
          );
        },
      ),
    );
  }

  Widget customBottomNavBar({required int index, required dynamic function}) =>
      BottomNavigationBar(
        elevation: 0.0,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: selectedItemColors[index], //look at constant file
        onTap: function,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: "",
          ),
        ],
      );

    Widget customTitle({
    required model,
    })=>Text(
      titles[model.currentIndex],
    );
}
