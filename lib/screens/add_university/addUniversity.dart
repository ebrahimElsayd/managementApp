import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/data/remote_data.dart';
import 'package:managementapp/data/remote_data_controller.dart';
import 'package:managementapp/models/university_model.dart';
import 'package:managementapp/screens/TextFormFeild.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';
import 'package:managementapp/shared/utils/crud.dart';
import 'package:managementapp/shared/utils/show_snack_bar.dart';

class AddUniversity extends StatefulWidget {
  AddUniversity({super.key});

  static const String routeName = "AddUniversity";

  @override
  State<AddUniversity> createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  TextEditingController universityController = TextEditingController();

  RemoteDataController? remoteData =
      RemoteDataControllerImpl(remoteData: RemoteDataImpl(crud: Crud()));

  final _formKey = GlobalKey<FormState>();

  void addUniversity() async {
    final res = await remoteData!.setUniiversityData(universityController.text);

    res.fold((l) => showSnackBar(context, l.erorr),
        (r) => showSnackBar(context, "successful adding university"));
  }

  @override
  void dispose() {
    universityController!.dispose();
    super.dispose();
  }

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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 100.h),
              child: LectureCollegeForm(
                numSize: 10.r,
                labelText: "University",
                controller: universityController,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 200.w,
              height: 60.h,
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
                    addUniversity();
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
      ),
    );
  }
}
