import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/screens/%20get_lec_data.dart/get_lecture_data_screen.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';

import 'package:managementapp/screens/addLectures/AddLectures.dart';
import 'package:managementapp/screens/add_university/addUniversity.dart';
import 'package:managementapp/screens/common/homeScreenBox.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 400,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          alignment: Alignment.topRight,
          onPressed: () {},
          icon: Icon(Icons.list),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30.sp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 50),
                    alignment: Alignment.center,
                    width: 400.w,
                    height: 220.h,
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/Rectangle2.png")),
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      "Welcome, to Lock management app!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: HomeScreeenBox("Add College",
                          AddColleges.routeName, 0xffFFA800, 0xffFFA800)),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                      child: HomeScreeenBox("Add Lecture",
                          AddLectures.routeName, 0xffEA7281, 0xffEA7281)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: HomeScreeenBox(
                          "Get Lecture Data",
                          GetLectureDataScreen.routeName,
                          0xff40A578,
                          0xff40A578)),
                  const SizedBox(width: 20),
                  Expanded(
                      child: HomeScreeenBox("Add University",
                          AddUniversity.routeName, 0xff2596be, 0xff2596be)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
