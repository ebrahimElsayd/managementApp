// import 'package:flutter/material.dart';
//
// typedef Validator = String? Function(String?);
//
// class CustomFormFeild extends StatelessWidget {
//   bool secureText;
//   Validator? validator;
//   String ?hint;
//   int lines;
//
//   TextEditingController? controller;
//   TextInputType? keyboardType;
//   IconData? icons;
// double numSize;
//   CustomFormFeild(
//       {super.key, this.lines = 1,
//       this.secureText = false,
//        this.hint,
//         this.numSize=30,
//       this.keyboardType = TextInputType.text,
//       this.validator,
//          this.icons,
//       this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       maxLines: lines,
//       minLines: lines,
//       validator: validator,
//       //  cursorColor: Colors.blue,
//       decoration: InputDecoration(
//         focusColor: Colors.white,
//         fillColor: Colors.white,
//         hintText: hint,
//         filled: true,
//         prefixIcon: Icon( icons),
//         //labelText: hint,
//         hintStyle: TextStyle(color: Colors.black38),
//         //hoverColor: Colors.yellow,
//       // suffixStyle: TextStyle(color: Colors.yellow)
//         errorStyle: TextStyle(color: Colors.yellow),
//
//
//
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//           borderRadius: BorderRadius.circular(numSize),
//         ),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//           borderRadius: BorderRadius.circular(numSize),
//         ),
//
//
//       ),
//
//       keyboardType: keyboardType,
//       obscureText: secureText,
//       controller: controller,
//     );
//   }
// }

import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  final bool secureText;
  final Validator? validator;
  final String? hint;
  final int lines;
  final double numSize;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? icons;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  CustomFormField({
    Key? key,
    this.lines = 1,
    this.secureText = false,
    this.hint,
    this.numSize = 30,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.icons,
    this.controller,
    this.isDropdown = false,
    this.dropdownItems,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDropdown
        ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              enabled: true,
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(icons),
              hintStyle: TextStyle(color: Colors.black38),
              errorStyle: TextStyle(color: Colors.yellow),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(numSize),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(numSize),
              ),
            ),
            value: selectedValue,
            items: dropdownItems?.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator,
          )
        : TextFormField(
            maxLines: lines,
            minLines: lines,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(icons),
              hintStyle: TextStyle(color: Colors.black38),
              errorStyle: TextStyle(color: Colors.yellow),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(numSize),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(numSize),
              ),
      ),
      keyboardType: keyboardType,
      obscureText: secureText,
      controller: controller,
    );
  }
}
