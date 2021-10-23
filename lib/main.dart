import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/shared/cubit/app_cubit.dart';
import 'package:msp_ainshams/data/shared/styles/themes/themes.dart';
import 'package:msp_ainshams/modules/splash_screen/splash_screen.dart';

import 'data/shared/network/local/cache/cache_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const MyApp());
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          AppCubit.get(context).getAppTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: AppCubit
                .get(context)
                .isDark! ? ThemeMode.dark : ThemeMode.light,
            home: const SplashScreen(),

          );
        },
      ),
    );
  }
}
