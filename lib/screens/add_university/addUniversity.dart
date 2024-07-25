import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/screens/TextFormFeild.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';

class AddUniversity extends StatelessWidget {
  AddUniversity({super.key});

  static const String routeName = "AddUniversity";
  TextEditingController universityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            opticalSize: 40.sp,
            color: Colors.white,
            weight: 20.sp,
            size: 40.sp,
            applyTextScaling: true),
        title: Text(
          " Add University Info",
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 100),
            child: LectureCollegeForm(
              numSize: 10,
              labelText: "University",
              controller: universityController,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color(0xff267446).withBlue(10)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                )),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle submit action
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
