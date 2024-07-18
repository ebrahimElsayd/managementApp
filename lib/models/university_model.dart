// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UniversityModel {
  int university_id;
  String university_name;
  UniversityModel({
    required this.university_id,
    required this.university_name,
  });

  UniversityModel copyWith({
    int? university_id,
    String? university_name,
  }) {
    return UniversityModel(
      university_id: university_id ?? this.university_id,
      university_name: university_name ?? this.university_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'university_id': university_id,
      'university_name': university_name,
    };
  }

  factory UniversityModel.fromMap(Map<String, dynamic> map) {
    return UniversityModel(
      university_id: map['university_id'] as int,
      university_name: map['university_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UniversityModel.fromJson(String source) =>
      UniversityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UniversityModel(university_id: $university_id, university_name: $university_name)';

  @override
  bool operator ==(covariant UniversityModel other) {
    if (identical(this, other)) return true;

    return other.university_id == university_id &&
        other.university_name == university_name;
  }

  @override
  int get hashCode => university_id.hashCode ^ university_name.hashCode;
}
