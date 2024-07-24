import 'package:flutter/material.dart';
import 'package:managementapp/models/collage_model.dart';
import 'package:managementapp/models/university_model.dart';

class CustomCollageDropDownMenuList extends StatefulWidget {
  final List<CollegeModel> dropdownItems;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final IconData? icons;
  final double numSize;

  const CustomCollageDropDownMenuList(
      {super.key,
      required this.icons,
      required this.dropdownItems,
      required this.onChanged,
      required this.hint,
      required this.numSize});

  @override
  State<CustomCollageDropDownMenuList> createState() =>
      _CustomCollageDropDownMenuListState();
}

class _CustomCollageDropDownMenuListState
    extends State<CustomCollageDropDownMenuList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabled: true,
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
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
      value: widget.dropdownItems[0].college_id.toString(),
      items: widget.dropdownItems.map((CollegeModel value) {
        return DropdownMenuItem<String>(
          value: value.college_id.toString(),
          child: Text(value.college_name),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
