import 'package:managementapp/models/collage_model.dart';
import 'package:managementapp/models/room_model.dart';
import 'package:managementapp/shared/components/api_links.dart';
import 'package:managementapp/shared/utils/crud.dart';

import '../shared/erorr/exception.dart';

abstract interface class RemoteData {
  Future<Map> getUniversityData();
  Future<Map> getCollageData(String universityId);
  Future<Map> setUniiversityData(String universityName);
  Future<Map> setCollageData(CollegeModel collegeModel);
  Future<Map> setRoomData(RoomModel roomModel);
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
    try {
      return crud.postData(ApiLinks.setCollageDataLink, {
        "university_id": collegeModel.university_id.toString(),
        "college_name": collegeModel.college_name,
        "departments": collegeModel.departments.toString(),
        "levels": collegeModel.levels.toString(),
        "country": collegeModel.country,
        "city": collegeModel.city.toString(),
        "location": ""
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map> setUniiversityData(String universityName) {
    try {
      return crud.postData(
          ApiLinks.setUniversityDataLink, {"university_name": universityName});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Map> setRoomData(RoomModel roomModel) {
    try {
      return crud.postData(ApiLinks.setRoomDataLink, {
        "faculty_id": roomModel.faculty_id.toString(),
        "college_id": roomModel.collage_id.toString(),
        "room_number": roomModel.room_number.toString(),
        "type": roomModel.type,
        "lattude": roomModel.lattude.toString(),
        "longtude": roomModel.longtude.toString(),
        "alttude": roomModel.alttude.toString()
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
