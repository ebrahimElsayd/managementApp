import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managementapp/screens/LoginScreen/LoginScreen.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "homeLayout";

  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            top: 160.h,
            left: 0.w,
            child: Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 160.h,
            right: 0.w,
            child: Container(
              alignment: Alignment.centerRight,
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 280.w,
              height: 470.h,
              padding: EdgeInsets.only(top: 40.h, left: 2.w),
              decoration: BoxDecoration(
                // color: Colors.red,
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/Rectangle 1.png")),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Align(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 30.h, left: 12.w, right: 12.w),
                          child: Image(
                            image: AssetImage(
                              "assets/images/lock-removebg-preview.png",
                            ),
                            fit: BoxFit.fill,
                            height: 80.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'welcome back!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'To keep connected with us please login with your personal info',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),

            // ClipRRect(
            //
            //   borderRadius: BorderRadius.circular(20),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            //     child: Container(
            //
            //       width: 270,
            //       height: 400,
            //       padding: const EdgeInsets.only(top: 40, left: 2),
            //       decoration: BoxDecoration(
            //         image:  DecorationImage(image: AssetImage("assets/images/lockImg.png")),
            //
            //         color: Colors.white.withOpacity(0.1),
            //         borderRadius: BorderRadius.circular(60),
            //         border: Border.all(
            //           width: BorderSide.strokeAlignOutside,
            //           color: Colors.white.withOpacity(0.4),
            //         ),
            //       ),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Column(
            //             children: [
            //               Align(
            //                 // alignment: Alignment.center,
            //                 child: Container(
            //                   //  color: Colors.white,
            //                   margin: const EdgeInsets.only(),
            //                   //  alignment: Alignment(100, 200),
            //                   child: const Image(
            //                     image: AssetImage(
            //                       "assets/images/lockImg.png",
            //                     ),
            //                     fit: BoxFit.fill,
            //                     height: 90,
            //                   ),
            //                 ),
            //               ),
            //               // Row(
            //               //   mainAxisAlignment: MainAxisAlignment.center,
            //               //   // crossAxisAlignment: CrossAxisAlignment.center,
            //               //   children: [
            //               //     Icon(Icons.lock_outline,
            //               //         size: 50, color: Colors.green),
            //               //     Text(
            //               //       'LOCK',
            //               //       style: TextStyle(
            //               //         color: Colors.white,
            //               //         fontSize: 32,
            //               //         fontWeight: FontWeight.bold,
            //               //       ),textAlign: TextAlign.center,
            //               //     ),
            //               //   ],
            //               // ),
            //               const SizedBox(height: 20),
            //               const Text(
            //                 'welcome back!',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 27,
            //                 ),
            //               ),
            //               const SizedBox(height: 30),
            //               const Text(
            //                 'To keep connected with us please login with your personal info',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: 22,
            //                   color: Colors.white70,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 30),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 120.h,
            widthFactor: 120.w,
            child: Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 1.h),
                      ),
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        size: 30.sp,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
