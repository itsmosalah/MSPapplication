import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/shared/cubit/app_cubit.dart';

Drawer customDrawer({
  required context
})=>Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Image(
            width: 150.0,
            height: 150.0,
            image: AssetImage("assets/images/MSP LOGO WHITE.png"),
          ),
        ),
      ),
      ListTile(

        title: Text(AppCubit.get(context).isDark!?'Dark theme on':'Dark theme off',style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Colors.black
        ),),
        leading:  CupertinoSwitch(
          activeColor: Colors.blue,
          value: AppCubit.get(context).isDark!,
          onChanged: (value) {
            AppCubit.get(context).changeAppTheme(value: value);
          },
        ),
        onTap: () {
        },
      ),
    ],
  ),
);