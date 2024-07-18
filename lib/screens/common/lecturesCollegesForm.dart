import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managementapp/screens/TextFormFeild.dart';

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
              height: 70,
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
