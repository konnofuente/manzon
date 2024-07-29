import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/member_entity.dart';

class MemberModel extends MemberEntity {
  MemberModel({
    required String id,
    required String name,
    required String role,
    required String userId,
  }) : super(
          id: id,
          name: name,
          role: role,
          userId: userId,
        );

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'userId': userId,
    };
  }
}
