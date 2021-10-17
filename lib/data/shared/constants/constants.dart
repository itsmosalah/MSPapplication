import 'package:flutter/material.dart';
import 'package:msp_ainshams/modules/about_us_screen/about_us_screen.dart';
import 'package:msp_ainshams/modules/crew_screen/crew_screen.dart';
import 'package:msp_ainshams/modules/events_screen/events_screen.dart';
import 'package:msp_ainshams/modules/projects_screen/projects_screen.dart';



/*List of screens that will be shown on the layout*/
const List<Widget> screens = [
    EventsScreen(),
    ProjectsScreen(),
    CrewScreen(),
    AboutUsScreen()
];

/*List of Titles that will be shown on the appBar*/
const List<String>titles = [
    "Events",
    "Projects",
    "Crew",
    "About Us",
];

/*Selected Item Color in bottom Nav Bar*/
const List<Color> selectedItemColors=[
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.pinkAccent,
];




/*Constant Widgets*/
Widget customLoadingData()=>const Center(
    child: CircularProgressIndicator(),
);

Widget getErrorFromServer({
    required context
})=> Center(
    child: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            const Icon(
                Icons.system_update_alt_sharp,
                size: 32.0,
            ),
            const SizedBox(
                height: 20.0,
            ),
            Text(
                'Failed To Get Data From Sever Please Try Again Later',
                style: Theme.of(context).textTheme.subtitle2,
            ),
        ],
    ),
);

Widget verticalDivider()=>const SizedBox(height: 10.0,);