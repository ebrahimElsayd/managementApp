// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CollegeModel {
  int college_id;
  String college_name;
  int departments;
  int levels;
  String country;
  String city;
  String? location;
  String created_at;
  int university_id;
  CollegeModel({
    required this.college_id,
    required this.college_name,
    required this.departments,
    required this.levels,
    required this.country,
    required this.city,
    this.location,
    required this.created_at,
    required this.university_id,
  });

  CollegeModel copyWith({
    int? college_id,
    String? college_name,
    int? departments,
    int? levels,
    String? country,
    String? city,
    String? location,
    String? created_at,
    int? university_id,
  }) {
    return CollegeModel(
      college_id: college_id ?? this.college_id,
      college_name: college_name ?? this.college_name,
      departments: departments ?? this.departments,
      levels: levels ?? this.levels,
      country: country ?? this.country,
      city: city ?? this.city,
      location: location ?? this.location,
      created_at: created_at ?? this.created_at,
      university_id: university_id ?? this.university_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'college_id': college_id,
      'college_name': college_name,
      'departments': departments,
      'levels': levels,
      'country': country,
      'city': city,
      'location': location,
      'created_at': created_at,
      'university_id': university_id,
    };
  }

  factory CollegeModel.fromMap(Map<String, dynamic> map) {
    return CollegeModel(
      college_id: map['college_id'] as int,
      college_name: map['college_name'] as String,
      departments: map['departments'] as int,
      levels: map['levels'] as int,
      country: map['country'] as String,
      city: map['city'] as String,
      location: map['location'] != null ? map['location'] as String : null,
      created_at: map['created_at'] as String,
      university_id: map['university_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollegeModel.fromJson(String source) =>
      CollegeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CollegeModel(college_id: $college_id, college_name: $college_name, departments: $departments, levels: $levels, country: $country, city: $city, location: $location, created_at: $created_at, university_id: $university_id)';
  }

  @override
  bool operator ==(covariant CollegeModel other) {
    if (identical(this, other)) return true;

    return other.college_id == college_id &&
        other.college_name == college_name &&
        other.departments == departments &&
        other.levels == levels &&
        other.country == country &&
        other.city == city &&
        other.location == location &&
        other.created_at == created_at &&
        other.university_id == university_id;
  }

  @override
  int get hashCode {
    return college_id.hashCode ^
        college_name.hashCode ^
        departments.hashCode ^
        levels.hashCode ^
        country.hashCode ^
        city.hashCode ^
        location.hashCode ^
        created_at.hashCode ^
        university_id.hashCode;
  }
}
