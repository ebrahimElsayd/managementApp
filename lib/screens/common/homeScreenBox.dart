import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';

class HomeScreeenBox extends StatelessWidget {
  HomeScreeenBox(this.text, this.RouteName, this.color, this.iconColor,
      {super.key});

  String text;
  String RouteName;
  int color;
  int iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.h, bottom: 5),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 2.w,
        ),
      ),
      width: 200.w,
      height: 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          //   SizedBox(height: 10,),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName);
                },
                child: Icon(
                  Icons.add,
                  size: 24.sp,
                  color: Color(iconColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
