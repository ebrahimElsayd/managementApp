import 'package:fpdart/fpdart.dart';
import 'package:managementapp/data/remote_data.dart';
import 'package:managementapp/models/collage_model.dart';
import 'package:managementapp/models/room_model.dart';
import 'package:managementapp/models/university_model.dart';

import '../shared/erorr/faliure.dart';

abstract interface class RemoteDataController {
  Future<Either<Faliure, List<UniversityModel>>> getUniversityData();
  Future<Either<Faliure, List<CollegeModel>>> getCollageData(
      String universityId);
  Future<Either<Faliure, bool>> setUniiversityData(String universityName);
  Future<Either<Faliure, bool>> setCollageData(CollegeModel collegeModel);
  Future<Either<Faliure, bool>> setRoomData(RoomModel roomModel);
}

class RemoteDataControllerImpl implements RemoteDataController {
  final RemoteData remoteData;
  const RemoteDataControllerImpl({required this.remoteData});
  @override
  Future<Either<Faliure, List<CollegeModel>>> getCollageData(
      String universityId) async {
    try {
      List<CollegeModel> collageModelList = [];
      final res = await remoteData.getCollageData(universityId);
      if (res["status"] == "success") {
        List collageData = res["data"];
        try {
          collageModelList
              .addAll(collageData.map((e) => CollegeModel.fromMap(e)));
        } catch (e) {
          print(e);
        }

        print("correct $collageModelList");
        return right(collageModelList);
      } else {
        throw "fail in request collage data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<UniversityModel>>> getUniversityData() async {
    try {
      List<UniversityModel> universityModelList = [];
      final res = await remoteData.getUniversityData();
      print("test");

      if (res["status"] == "success") {
        List universityData = res['data'];

        universityModelList.addAll(
            universityData.map((e) => UniversityModel.fromMap(e)).toList());

        return right(universityModelList);
      } else {
        throw "fail in request collage data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

//test
  @override
  Future<Either<Faliure, bool>> setCollageData(
      CollegeModel collegeModel) async {
    try {
      final res = await remoteData.setCollageData(collegeModel);
      if (res["status"] == "success") {
        return right(true);
      } else {
        throw "Erorr while set your data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, bool>> setUniiversityData(
      String universityName) async {
    try {
      final res = await remoteData.setUniiversityData(universityName);
      if (res["status"] == "success") {
        return right(true);
      } else {
        throw "Erorr while set your data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, bool>> setRoomData(RoomModel roomModel) async {
    try {
      final res = await remoteData.setRoomData(roomModel);
      if (res["status"] == "success") {
        return right(true);
      } else {
        throw "Erorr while set your data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }
}
