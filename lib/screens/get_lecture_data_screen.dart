import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../shared/utils/show_snack_bar.dart';
import 'package:managementapp/shared/utils/show_snack_bar.dart';

class GetLectureDataScreen extends StatefulWidget {
  const GetLectureDataScreen({super.key});

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

  Future<void> calcDistance(
      double firstTotalLatitude,
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AnimatedOpacity(
                    opacity:
                        firstTotalLatitude == 0.0 || firstTotalLongitude == 0.0
                            ? 0.0
                            : 1.0,
                    duration: Duration(seconds: 1),
                    child: Text(
                        "First point is (${firstTotalLatitude / 4}, ${firstTotalLongitude / 4})"),
                  ),
                  AnimatedOpacity(
                    opacity: secondTotalLatitude == 0.0 ||
                            secondTotalLongitude == 0.0
                        ? 0.0
                        : 1.0,
                    duration: Duration(seconds: 1),
                    child: Text(
                        "Second point is (${secondTotalLatitude / 4}, ${secondTotalLongitude / 4})"),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => check == 2 ? reInitVals() : getCurrentPoint(),
              child: Text("Get current point"),
            ),
            AnimatedOpacity(
              opacity: secondTotalLatitude == 0.0 || secondTotalLongitude == 0.0
                  ? 0.0
                  : 1.0,
              duration: Duration(seconds: 1),
              child: Text("Distance ${distanceInMeters} meters"),
            )
          ],
        ),
      ),
    );
  }
}
