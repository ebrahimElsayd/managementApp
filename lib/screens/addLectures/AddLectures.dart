import 'package:flutter/material.dart';
import 'package:managementapp/data/remote_data.dart';
import 'package:managementapp/data/remote_data_controller.dart';
import 'package:managementapp/models/collage_model.dart';

import 'package:managementapp/models/room_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/models/university_model.dart';

import 'package:managementapp/screens/TextFormFeild.dart';
import 'package:managementapp/shared/utils/crud.dart';

import '../../shared/utils/show_snack_bar.dart';
import '../addColleges/widget/university_drop_down_menu_list.dart';
import 'widget/collage_drop_down_menu_list.dart';

class AddLectures extends StatefulWidget {
  static const String routeName = "addLectures";

  AddLectures({super.key});

  @override
  State<AddLectures> createState() => _AddLecturesState();
}

class _AddLecturesState extends State<AddLectures> {
  TextEditingController roomNumberController = TextEditingController();

  TextEditingController typeController = TextEditingController();

  TextEditingController latitudeController = TextEditingController();

  TextEditingController longitudeController = TextEditingController();

  TextEditingController altitudeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RemoteDataController? remoteData;

  String? selectedFaculty;

  String? selectedCollege;

  String? selectedUniversity;

  final List<String> faculties = ['Science', 'Arts', 'Engineering'];

  List<CollegeModel> collages = [];

  List<UniversityModel> universities = [];

  void getUniversiyData() async {
    final res = await remoteData!.getUniversityData();
    setState(() {
      res.fold((l) {
        showSnackBar(context, "$l");
        universities = [];
      }, (r) {
        universities = r;
        print(r);
      });
    });
  }

  void getCollageData(String universityId) async {
    final res = await remoteData!.getCollageData(universityId);
    setState(() {
      res.fold((l) {
        showSnackBar(context, "$l");
        collages = [];
      }, (r) {
        collages = r;
        print(r);
      });
    });
  }

  void addLecture() async {
    final roomModel = RoomModel(
        room_id: 0,
        room_number: int.parse(roomNumberController.text),
        type: typeController.text,
        lattude: double.parse(latitudeController.text),
        longtude: double.parse(longitudeController.text),
        alttude: double.parse(altitudeController.text),
        collage_id: int.parse(selectedCollege!),
        faculty_id: 1);
    final res = await remoteData!.setRoomData(roomModel);

    res.fold((l) => showSnackBar(context, l.erorr),
        (r) => showSnackBar(context, "successfuly add room"));
  }

  @override
  void initState() {
    remoteData =
        RemoteDataControllerImpl(remoteData: RemoteDataImpl(crud: Crud()));
    getUniversiyData();
    super.initState();
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
          "Add Lecture",
          style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 70.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LectureCollegeForm(
                  numSize: 10.r,
                  labelText: "Room Number:",
                  controller: roomNumberController,
                ),
                SizedBox(height: 30.h),
                LectureCollegeForm(
                  numSize: 10.r,
                  labelText: "Type:",
                  controller: typeController,
                ),
                SizedBox(height: 30.h),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Latitude:",
                  controller: latitudeController,
                ),
                SizedBox(height: 30.h),
                LectureCollegeForm(
                  numSize: 10.sp,
                  labelText: "Longitude:",
                  controller: longitudeController,
                ),
                SizedBox(height: 30.h),
                LectureCollegeForm(
                  numSize: 10.sp,
                  labelText: "Altitude:",
                  controller: altitudeController,
                ),
                SizedBox(height: 30.h),
                LectureCollegeForm(
                  labelText: "Faculty:",
                  isDropdown: true,
                  dropdownItems: faculties,
                  selectedValue: selectedFaculty,
                  onChanged: (newValue) {
                    selectedFaculty = newValue;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                universities.isEmpty
                    ? Container()
                    : CustomUniversityDropDownMenuList(
                        icons: Icons.keyboard_arrow_down,
                        dropdownItems: universities,
                        onChanged: (newValue) {
                          selectedUniversity = newValue;
                          getCollageData(newValue!);
                          print(selectedUniversity);
                        },
                        hint: "Select Option",
                        numSize: 30.r),
                SizedBox(height: 30.h),
                collages.isEmpty
                    ? Container()
                    : CustomCollageDropDownMenuList(
                        icons: Icons.keyboard_arrow_down,
                        dropdownItems: collages,
                        onChanged: (newValue) {
                          selectedCollege = newValue;
                          print(selectedCollege);
                        },
                        hint: "Select Option",
                        numSize: 30.r),
                SizedBox(height: 60.h),
                SizedBox(height: 60.h),
                SizedBox(
                  width: 200.h,
                  height: 60.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Color(0xff267446).withBlue(10)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addLecture();
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
        ),
      ),
    );
  }
}

class LectureCollegeForm extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final double numSize;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  LectureCollegeForm({
    required this.labelText,
    this.controller,
    this.numSize = 20.0,
    this.isDropdown = false,
    this.dropdownItems,
    this.selectedValue,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 45,
              width: 300,
              child: CustomFormField(
                numSize: numSize,
                controller: controller,
                isDropdown: isDropdown,
                dropdownItems: dropdownItems,
                selectedValue: selectedValue,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
