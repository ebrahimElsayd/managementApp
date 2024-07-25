import 'package:flutter/material.dart';
import 'package:managementapp/data/remote_data.dart';
import 'package:managementapp/data/remote_data_controller.dart';
import 'package:managementapp/models/university_model.dart';
import 'package:managementapp/screens/TextFormFeild.dart';
import 'package:managementapp/screens/addColleges/widget/university_drop_down_menu_list.dart';
import 'package:managementapp/shared/utils/crud.dart';
import 'package:managementapp/shared/utils/show_snack_bar.dart';

import '../../models/collage_model.dart';

class AddColleges extends StatefulWidget {
  static const String routeName = "addCollege";

  const AddColleges({super.key});

  @override
  State<AddColleges> createState() => _AddCollegesState();
}

class _AddCollegesState extends State<AddColleges> {
  TextEditingController? collageNameController;
  TextEditingController? cityController;
  TextEditingController? locationController;
  TextEditingController? levelController;
  TextEditingController? departmentController;
  TextEditingController? countryController;
  TextEditingController? universityNameController;
  RemoteDataController? remoteData;
  final _formKey = GlobalKey<FormState>();
  List<UniversityModel> universities = [];

  void getUniversiyData() async {
    final res = await remoteData!.getUniversityData();
    setState(() {
      res.fold((l) => showSnackBar(context, "$l"), (r) {
        universities = r;
        print(r);
      });
    });
  }

  void addCollage() async {
    final collageModel = CollegeModel(
        college_name: collageNameController!.text,
        city: cityController!.text,
        location: locationController!.text,
        levels: int.parse(levelController!.text),
        departments: int.parse(departmentController!.text),
        country: countryController!.text,
        created_at: "",
        college_id: 0,
        university_id: int.parse(selectedUniversity!));
    final res = await remoteData!.setCollageData(collageModel);
    res.fold((l) => showSnackBar(context, l.erorr),
        (r) => showSnackBar(context, "successfuly add collage"));
  }

  @override
  void initState() {
    collageNameController = TextEditingController();
    cityController = TextEditingController();
    locationController = TextEditingController();
    levelController = TextEditingController();
    departmentController = TextEditingController();
    countryController = TextEditingController();
    universityNameController = TextEditingController();
    print("init");
    remoteData =
        RemoteDataControllerImpl(remoteData: RemoteDataImpl(crud: Crud()));
    getUniversiyData();
    super.initState();
  }

  @override
  void dispose() {
    collageNameController!.dispose();
    cityController!.dispose();
    locationController!.dispose();
    levelController!.dispose();
    departmentController!.dispose();
    countryController!.dispose();
    universityNameController!.dispose();
    super.dispose();
  }

  String? selectedUniversity;

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
        title: const Text(
          "Add Collage",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 70),
          margin: const EdgeInsets.only(bottom: 30),
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
                  labelText: "Country:",
                  controller: countryController,
                ),
                const SizedBox(height: 30),

                universities.isEmpty
                    ? CircularProgressIndicator.adaptive()
                    : CustomUniversityDropDownMenuList(
                        icons: Icons.keyboard_arrow_down,
                        dropdownItems: universities,
                        onChanged: (newValue) {
                          selectedUniversity = newValue;
                          print(selectedUniversity);
                        },
                        hint: "Select Option",
                        numSize: 30),

                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "University Name:",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    Expanded(
                      flex: 3,
                      child: CustomUniversityDropDownMenuList(
                          icons: Icons.keyboard_arrow_down,
                          dropdownItems: universities,
                          initialValue: initialValue!,
                          onChanged: (newValue) {
                            selectedUniversity = newValue;
                          },
                          hint: "Select Option",
                          numSize: 30),
                    ),
                  ],
                ),

                const SizedBox(height: 60),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color(0xff267446).withBlue(10)),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addCollage();
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

  const LectureCollegeForm({
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
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            labelText,
            style: const TextStyle(
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
    );
  }
}
