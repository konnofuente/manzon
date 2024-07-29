import 'package:manzon/domain/entities/export_domain_entities.dart';


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

  // Override the fromJson method to use the constructor of MemberModel
  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      userId: json['userId'],
    );
  }

  // Override the toJson method to maintain compatibility
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'userId': userId,
    };
  }
}
