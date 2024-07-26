import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/utils/show_snack_bar.dart';

class GetLectureDataScreen extends StatefulWidget {
  const GetLectureDataScreen({super.key});

  static const String routeName = "lectureData";

  @override
  State<GetLectureDataScreen> createState() => _GetLectureDataScreenState();
}

class _GetLectureDataScreenState extends State<GetLectureDataScreen> {
  double firstTotalLatitude = 0.0;
  double firstTotalLongitude = 0.0;
  double secondTotalLatitude = 0.0;
  double secondTotalLongitude = 0.0;
  double distanceInMeters = 0.0;
  int check = 0;

  void reInitVals() {
    secondTotalLatitude = 0.0;
    secondTotalLongitude = 0.0;
    firstTotalLatitude = 0.0;
    firstTotalLongitude = 0.0;
    check = 0;
    distanceInMeters = 0.0;
    setState(() {});
  }

  void checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  Future<void> calcDistance(double firstTotalLatitude,
      double firstTotalLongitude,
      double secoundTotalLatitude,
      double secoundTotalLongitude) async {
    try {
      distanceInMeters = await Geolocator.distanceBetween(
        firstTotalLatitude / 4.0,
        firstTotalLongitude / 4.0,
        secoundTotalLatitude / 4.0,
        secoundTotalLongitude / 4.0,
      );
      setState(() {});
    } catch (e) {
      showSnackBar(context, "Error in getting data");
    }
  }

  Future<void> getCurrentPoint() async {
    List<Position> positions = [];

    for (int i = 0; i < 4; i++) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      positions.add(position);
      await Future.delayed(const Duration(milliseconds: 200));
    }

    for (Position position in positions) {
      if (check == 0) {
        firstTotalLatitude += position.latitude;
        firstTotalLongitude += position.longitude;
      } else {
        secondTotalLatitude += position.latitude;
        secondTotalLongitude += position.longitude;
        await calcDistance(firstTotalLatitude, firstTotalLongitude,
            secondTotalLatitude, secondTotalLongitude);
      }
    }
    setState(() {
      check++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/img_4.png",
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              opticalSize: 40.sp,
              color: Colors.white,
              weight: 20.w,
              size: 35.sp,
              applyTextScaling: true),
          title: Text(
            "Get Lecture Data",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity:
                      firstTotalLatitude == 0.0 || firstTotalLongitude == 0.0
                          ? 0.0
                          : 1.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "First point is     (${firstTotalLatitude / 4}, ${firstTotalLongitude / 4})",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedOpacity(
                  opacity:
                      secondTotalLatitude == 0.0 || secondTotalLongitude == 0.0
                          ? 0.0
                          : 1.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "Second point is (${secondTotalLatitude / 4}, ${secondTotalLongitude / 4})",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AnimatedOpacity(
                    opacity: secondTotalLatitude == 0.0 ||
                            secondTotalLongitude == 0.0
                        ? 0.0
                        : 1.0,
                    duration: Duration(seconds: 1),
                    child: Text(
                      "Distance :           ${distanceInMeters} meters",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 80),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(24),
                      )),
                    ),
                    onPressed: () =>
                        check == 2 ? reInitVals() : getCurrentPoint(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Get current point",
                        style: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
