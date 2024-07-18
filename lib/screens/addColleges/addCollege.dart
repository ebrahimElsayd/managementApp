// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'package:managementapp/screens/LoginScreen/validationUtilities.dart';
// import 'package:managementapp/screens/TextFormFeild.dart';
// import 'package:managementapp/screens/common/lecturesCollegesForm.dart';
//
// class AddLectures extends StatelessWidget {
//   static const String routeName = "addLectures";
//
//   AddLectures({super.key});
//
//
//
//   TextEditingController RoomNumber = TextEditingController();
//   TextEditingController Type = TextEditingController();
//   TextEditingController Latitude = TextEditingController();
//
//   TextEditingController Longtude = TextEditingController();
//   TextEditingController Alttude = TextEditingController();
//   TextEditingController Faculty = TextEditingController();
//   TextEditingController collage = TextEditingController();
//   TextEditingController University = TextEditingController();
//
//
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.white,
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           image: DecorationImage(
//             image: AssetImage(
//               "assets/images/loginBg.png",
//             ),
//             fit: BoxFit.fill,
//           )),
//       child: Scaffold(
//        // resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.only(left: 12, right: 12, top: 70),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 //  crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   LectureCollegeForm("Room Number:",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm(" type : ",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("Latitude:",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("Longtude:",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("Alttude:",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("Faculty :",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("collage",10),
//                   const SizedBox(
//                     height: 30,
//
//                   ),
//                   LectureCollegeForm("University ",10),
//                   const SizedBox(
//                     height: 60,
//
//                   ),
//                   SizedBox(
//                     width: 200,
//                     height: 60,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:MaterialStatePropertyAll(Color(0xff267446).withBlue(10)),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24),
//                         )),
//                       ),
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                          // print(email);
//                         }
//
//                         // Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
//                       },
//                       child: const Text(
//                         "Submit",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//
//
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:managementapp/screens/TextFormFeild.dart';

class AddColleges extends StatelessWidget {
  static const String routeName = "addCollege";

  AddColleges({super.key});

  TextEditingController collageNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController createdAttController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController universityNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectedUniversity;

  final List<String> universities = [
    'University X',
    'University Y',
    'University Z'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          "Add Collage",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 70),
          margin: EdgeInsets.only(bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "College Name:",
                  controller: collageNameController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "City:",
                  controller: cityController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Location:",
                  controller: locationController,
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
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Level:",
                  controller: levelController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Department:",
                  controller: departmentController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Created At:",
                  controller: createdAttController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "Country:",
                  controller: countryController,
                ),
                const SizedBox(height: 30),
                LectureCollegeForm(
                  numSize: 10,
                  labelText: "University Name:",
                  controller: universityNameController,
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
