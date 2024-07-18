import 'package:flutter/material.dart';
import 'package:managementapp/screens/TextFormFeild.dart';

class AddLectures extends StatelessWidget {
  static const String routeName = "addLectures";

  AddLectures({super.key});

  TextEditingController roomNumberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController altitudeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectedFaculty;
  String? selectedCollege;
  String? selectedUniversity;

  final List<String> faculties = ['Science', 'Arts', 'Engineering'];
  final List<String> colleges = ['College A', 'College B', 'College C'];
  final List<String> universities = [
    'University X',
    'University Y',
    'University Z'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
            opticalSize: 40,
            color: Colors.white,
            weight: 20,
            size: 40,
            applyTextScaling: true),
        title: Text(
          "Add Lecture",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 70),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Room Number:",
                  controller: roomNumberController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Type:",
                  controller: typeController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Latitude:",
                  controller: latitudeController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Longitude:",
                  controller: longitudeController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Altitude:",
                  controller: altitudeController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  labelText: "Faculty:",
                  isDropdown: true,
                  dropdownItems: faculties,
                  selectedValue: selectedFaculty,
                  onChanged: (newValue) {
                    selectedFaculty = newValue;
                  },
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  labelText: "College:",
                  isDropdown: true,
                  dropdownItems: colleges,
                  selectedValue: selectedCollege,
                  onChanged: (newValue) {
                    selectedCollege = newValue;
                  },
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  labelText: "University:",
                  isDropdown: true,
                  dropdownItems: universities,
                  selectedValue: selectedUniversity,
                  onChanged: (newValue) {
                    selectedUniversity = newValue;
                  },
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xff267446).withBlue(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle submit action
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
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
