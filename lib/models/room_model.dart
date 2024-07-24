// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RoomModel {
  final int room_id;
  final int room_number;
  final String type;
  final double lattude;
  final double longtude;
  final double alttude;
  final int collage_id;
  final int faculty_id;
  RoomModel({
    required this.room_id,
    required this.room_number,
    required this.type,
    required this.lattude,
    required this.longtude,
    required this.alttude,
    required this.collage_id,
    required this.faculty_id,
  });

  RoomModel copyWith({
    int? room_id,
    int? room_number,
    String? type,
    double? lattude,
    double? longtude,
    double? alttude,
    int? collage_id,
    int? faculty_id,
  }) {
    return RoomModel(
      room_id: room_id ?? this.room_id,
      room_number: room_number ?? this.room_number,
      type: type ?? this.type,
      lattude: lattude ?? this.lattude,
      longtude: longtude ?? this.longtude,
      alttude: alttude ?? this.alttude,
      collage_id: collage_id ?? this.collage_id,
      faculty_id: faculty_id ?? this.faculty_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'room_id': room_id,
      'room_number': room_number,
      'type': type,
      'lattude': lattude,
      'longtude': longtude,
      'alttude': alttude,
      'collage_id': collage_id,
      'faculty_id': faculty_id,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      room_id: map['room_id'] as int,
      room_number: map['room_number'] as int,
      type: map['type'] as String,
      lattude: map['lattude'] as double,
      longtude: map['longtude'] as double,
      alttude: map['alttude'] as double,
      collage_id: map['collage_id'] as int,
      faculty_id: map['faculty_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomModel(room_id: $room_id, room_number: $room_number, type: $type, lattude: $lattude, longtude: $longtude, alttude: $alttude, collage_id: $collage_id, faculty_id: $faculty_id)';
  }

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;

    return other.room_id == room_id &&
        other.room_number == room_number &&
        other.type == type &&
        other.lattude == lattude &&
        other.longtude == longtude &&
        other.alttude == alttude &&
        other.collage_id == collage_id &&
        other.faculty_id == faculty_id;
  }

  @override
  int get hashCode {
    return room_id.hashCode ^
        room_number.hashCode ^
        type.hashCode ^
        lattude.hashCode ^
        longtude.hashCode ^
        alttude.hashCode ^
        collage_id.hashCode ^
        faculty_id.hashCode;
  }
}
