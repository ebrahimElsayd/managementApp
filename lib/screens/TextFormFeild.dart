import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormFeild extends StatelessWidget {
  bool secureText;
  Validator? validator;
  String hint;
  int lines;

  TextEditingController? controller;
  TextInputType? keyboardType;
bool icon;
  CustomFormFeild(
      {super.key, this.lines = 1,
      this.secureText = false,
      required this.hint,
      this.keyboardType = TextInputType.text,
      this.validator,
         this.icon=true,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      minLines: lines,
      validator: validator,
      //  cursorColor: Colors.blue,
      decoration: InputDecoration(
        focusColor: Colors.white,
        fillColor: Colors.white,
        hintText: hint,
        filled: true,
        prefixIcon: Icon( icon?Icons.lock:Icons.email),
        //labelText: hint,
        hintStyle: TextStyle(color: Colors.black38),
        //hoverColor: Colors.yellow,
      // suffixStyle: TextStyle(color: Colors.yellow)
        errorStyle: TextStyle(color: Colors.yellow),



        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),


      ),

      keyboardType: keyboardType,
      obscureText: secureText,
      controller: controller,
    );
  }
}
