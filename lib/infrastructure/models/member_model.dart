import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/member_entity.dart';

class MemberModel extends MemberEntity {
  MemberModel({
    required String id,
    required String name,
    required String role,
    required String userId,
    required String phoneNumber,
  }) : super(
          id: id,
          name: name,
          role: role,
          userId: userId,
          phoneNumber: phoneNumber,
        );

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      userId: json['userId'],
      phoneNumber: json['phoneNumber'], // Deserialize from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'userId': userId,
      'phoneNumber': phoneNumber, // Serialize to JSON
    };
  }
}
