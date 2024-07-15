import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:managementapp/layout/homeLayout.dart';
import 'package:managementapp/screens/LoginScreen/LoginScreen.dart'; // Required for the BackdropFilter

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        HomeLayout.routeName: (context)=>HomeLayout(),
        LoginScreen.routeName:(context)=>LoginScreen()
      },
      initialRoute:HomeLayout.routeName,
    );

  }
}

