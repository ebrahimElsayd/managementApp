import 'package:flutter/material.dart';
import 'package:managementapp/models/university_model.dart';

class CustomUniversityDropDownMenuList extends StatefulWidget {
  final List<UniversityModel> dropdownItems;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final IconData? icons;
  final double numSize;

  const CustomUniversityDropDownMenuList(
      {super.key,
      required this.icons,
      required this.dropdownItems,
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
        hintStyle: const TextStyle(color: Colors.black38),
        errorStyle: const TextStyle(color: Colors.yellow),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(widget.numSize),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(widget.numSize),
        ),
      ),
      value: widget.dropdownItems[0].university_id.toString(),
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
