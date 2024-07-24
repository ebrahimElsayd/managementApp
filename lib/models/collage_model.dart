// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CollegeModel {
  int collegeId;
  String collegeName;
  int departments;
  int levels;
  String country;
  String city;
  String location;
  String createdAt;
  int universityId;
  CollegeModel({
    required this.collegeId,
    required this.collegeName,
    required this.departments,
    required this.levels,
    required this.country,
    required this.city,
    required this.location,
    required this.createdAt,
    required this.universityId,
  });

  CollegeModel copyWith({
    int? collegeId,
    String? collegeName,
    int? departments,
    int? levels,
    String? country,
    String? city,
    String? location,
    String? createdAt,
    int? universityId,
  }) {
    return CollegeModel(
      collegeId: collegeId ?? this.collegeId,
      collegeName: collegeName ?? this.collegeName,
      departments: departments ?? this.departments,
      levels: levels ?? this.levels,
      country: country ?? this.country,
      city: city ?? this.city,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      universityId: universityId ?? this.universityId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collegeId': collegeId,
      'collegeName': collegeName,
      'departments': departments,
      'levels': levels,
      'country': country,
      'city': city,
      'location': location,
      'createdAt': createdAt,
      'universityId': universityId,
    };
  }

  factory CollegeModel.fromMap(Map<String, dynamic> map) {
    return CollegeModel(
      collegeId: map['collegeId'] as int,
      collegeName: map['collegeName'] as String,
      departments: map['departments'] as int,
      levels: map['levels'] as int,
      country: map['country'] as String,
      city: map['city'] as String,
      location: map['location'] as String,
      createdAt: map['createdAt'] as String,
      universityId: map['universityId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollegeModel.fromJson(String source) =>
      CollegeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'College(collegeId: $collegeId, collegeName: $collegeName, departments: $departments, levels: $levels, country: $country, city: $city, location: $location, createdAt: $createdAt, universityId: $universityId)';
  }

  @override
  bool operator ==(covariant CollegeModel other) {
    if (identical(this, other)) return true;

    return other.collegeId == collegeId &&
        other.collegeName == collegeName &&
        other.departments == departments &&
        other.levels == levels &&
        other.country == country &&
        other.city == city &&
        other.location == location &&
        other.createdAt == createdAt &&
        other.universityId == universityId;
  }

  @override
  int get hashCode {
    return collegeId.hashCode ^
        collegeName.hashCode ^
        departments.hashCode ^
        levels.hashCode ^
        country.hashCode ^
        city.hashCode ^
        location.hashCode ^
        createdAt.hashCode ^
        universityId.hashCode;
  }
}
