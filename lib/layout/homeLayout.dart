import 'dart:ui';

import 'package:flutter/material.dart';
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
            top: 190,
            left: 15,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 195,
            right: 15,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.yellow.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 270,
                  height: 400,
                  padding: const EdgeInsets.only(top: 40, left: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: BorderSide.strokeAlignOutside,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Align(
                            // alignment: Alignment.center,
                            child: Container(
                              //  color: Colors.white,
                              margin: const EdgeInsets.only(),
                              //  alignment: Alignment(100, 200),
                              child: const Image(
                                image: AssetImage(
                                  "assets/images/lockImg.png",
                                ),
                                fit: BoxFit.fill,
                                height: 90,
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   // crossAxisAlignment: CrossAxisAlignment.center,
                          //   children: [
                          //     Icon(Icons.lock_outline,
                          //         size: 50, color: Colors.green),
                          //     Text(
                          //       'LOCK',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 32,
                          //         fontWeight: FontWeight.bold,
                          //       ),textAlign: TextAlign.center,
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20),
                          const Text(
                            'welcome back!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'To keep connected with us please login with your personal info',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 120,
            widthFactor: 120,
            child: Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        size: 30,
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
