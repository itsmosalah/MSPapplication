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