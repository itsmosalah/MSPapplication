import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/layout/cubit/layout_state.dart';

import 'cubit/layout_cubit.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          LayoutCubit model = LayoutCubit.get(context);

          int indexOfBottomNavBar = model.currentIndex;

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 20.0,
              title: customTitle(
                model: model,
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: selectedItemColors[index], //look at constant file
        onTap: function,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.event,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.work,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.group,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
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
      style: const TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
      ),
    );
}
