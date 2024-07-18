import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:managementapp/screens/addColleges/addCollege.dart';

import 'package:managementapp/screens/addLectures/AddLectures.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 400,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          alignment: Alignment.topRight,
          onPressed: () {},
          icon: Icon(Icons.list),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    alignment: Alignment.center,
                    width: 340,
                    height: 203,
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    child: Text(
                      "Welcome to ,Lock management app!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Color(0xffFFA800),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    width: 200,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Add College",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(8.0)),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AddColleges.routeName);
                              },
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color: Color(0xffEA7281),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Color(0xffEA7281),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    width: 200,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Add Lecture",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.all(8.0)),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AddLectures.routeName);
                              },
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color: Color(0xffEA7281),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  color: Color(0xff40A578),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Get Lecture Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(8.0)),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AddLectures.routeName);
                          },
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Color(0xffEA7281),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
