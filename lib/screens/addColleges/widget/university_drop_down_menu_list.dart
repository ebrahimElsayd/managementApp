import 'package:flutter/material.dart';
import 'package:managementapp/models/university_model.dart';

class CustomUniversityDropDownMenuList extends StatefulWidget {
  final List<UniversityModel> dropdownItems;
  final UniversityModel initialValue;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final IconData? icons;
  final double numSize;

  const CustomUniversityDropDownMenuList(
      {super.key,
      required this.icons,
      required this.dropdownItems,
      required this.initialValue,
      required this.onChanged,
      required this.hint,
      required this.numSize});

  @override
  State<CustomUniversityDropDownMenuList> createState() =>
      _CustomUniversityDropDownMenuListState();
}

class _CustomUniversityDropDownMenuListState
    extends State<CustomUniversityDropDownMenuList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabled: true,
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
        prefixIcon: Icon(widget.icons),
        hintStyle: TextStyle(color: Colors.black38),
        errorStyle: TextStyle(color: Colors.yellow),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(widget.numSize),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(widget.numSize),
        ),
      ),
      value: widget.initialValue.university_name,
      items: widget.dropdownItems.map((UniversityModel value) {
        return DropdownMenuItem<String>(
          value: value.university_id.toString(),
          child: Text(value.university_name),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
