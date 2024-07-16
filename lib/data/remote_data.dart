import 'package:managementapp/models/collage_model.dart';
import 'package:managementapp/models/university_model.dart';
import 'package:managementapp/shared/components/constants.dart';
import 'package:managementapp/shared/utils/crud.dart';

import '../shared/erorr/exception.dart';

abstract interface class RemoteData {
  Future<Map> getUniversityData();
  Future<Map> getCollageData(String universityId);
  Future<Map> setUniiversityData(UniversityModel universityModel);
  Future<Map> setCollageData(CollegeModel collegeModel);
}

class RemoteDataImpl implements RemoteData {
  final Crud crud;
  RemoteDataImpl({required this.crud});
  @override
  Future<Map> getCollageData(String universityId) {
    try {
      return crud.postData(
          ApiLinks.getCollageDataLink, {"university_id": universityId});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map> getUniversityData() {
    try {
      return crud.postData(ApiLinks.getUniversityDataLink, {});
    } catch (e) {
      throw ServerException(e.toString());
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
