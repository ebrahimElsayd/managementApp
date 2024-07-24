import 'package:fpdart/fpdart.dart';
import 'package:managementapp/data/remote_data.dart';
import 'package:managementapp/models/collage_model.dart';
import 'package:managementapp/models/university_model.dart';

import '../shared/erorr/faliure.dart';

abstract interface class RemoteDataController {
  Future<Either<Faliure, List<UniversityModel>>> getUniversityData();
  Future<Either<Faliure, List<CollegeModel>>> getCollageData(
      String universityId);
  Future<Map> setUniiversityData(UniversityModel universityModel);
  Future<Map> setCollageData(CollegeModel collegeModel);
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
        collageModelList
            .addAll(collageData.map((e) => CollegeModel.fromJson(e)));
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
      if (res["status"] == "success") {
        List universityData = res["data"];
        universityModelList
            .addAll(universityData.map((e) => UniversityModel.fromJson(e)));
        return right(universityModelList);
      } else {
        throw "fail in request collage data";
      }
    } catch (e) {
      return left(Faliure(e.toString()));
    }
  }

  @override
  Future<Map> setCollageData(CollegeModel collegeModel) {
    // TODO: implement setCollageData
    throw UnimplementedError();
  }

  @override
  Future<Map> setUniiversityData(UniversityModel universityModel) {
    // TODO: implement setUniiversityData
    throw UnimplementedError();
  }
}
