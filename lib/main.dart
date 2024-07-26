import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:managementapp/layout/homeLayout.dart';
import 'package:managementapp/screens/%20get_lec_data.dart/get_lecture_data_screen.dart';
import 'package:managementapp/screens/HomeScreen/HomeScreen.dart';
import 'package:managementapp/screens/LoginScreen/LoginScreen.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';
import 'package:managementapp/screens/addLectures/AddLectures.dart';
import 'package:managementapp/screens/add_university/addUniversity.dart'; // Required for the BackdropFilter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(342, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                primaryColor: Colors.blue,
                scaffoldBackgroundColor: Color(0xFFDFECDB),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.blue,
                ),
                useMaterial3: false,
              ),
        routes: {
                HomeLayout.routeName: (context) => HomeLayout(),
                LoginScreen.routeName: (context) => LoginScreen(),
                AddLectures.routeName: (context) => AddLectures(),
                AddColleges.routeName: (context) => AddColleges(),
                HomeScreen.routeName: (context) => HomeScreen(),
                AddUniversity.routeName: (context) => AddUniversity(),
                GetLectureDataScreen.routeName: (context) =>
                    GetLectureDataScreen(),
              },
              initialRoute: HomeLayout.routeName

              //HomeLayout.routeName,
              );
        });
  }
}
