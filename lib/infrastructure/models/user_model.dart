import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/entities/enums/role_enum.dart';
import 'package:manzon/infrastructure/models/media_model.dart';



class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String phoneNumber,
    String? name,
    List<String>? associations,
    List<Role>? roles,
    MediaModel? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? birthDate,
    DateTime? lastSeen,
    String? deviceToken,
  }) : super(
          id: id,
          phoneNumber: phoneNumber,
          name: name,
          associations: associations,
          roles: roles,
          avatar: avatar,
          createdAt: createdAt,
          updatedAt: updatedAt,
          birthDate: birthDate,
          lastSeen: lastSeen,
          deviceToken: deviceToken,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      associations: (json['associations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.values[e as int])
          .toList(),
      avatar: json['avatar'] != null
          ? MediaModel.fromJson(json['avatar'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      birthDate: json['birthDate'] != null
          ? DateTime.parse(json['birthDate'])
          : null,
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'])
          : null,
      deviceToken: json['deviceToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'associations': associations,
      'roles': roles?.map((role) => role.index).toList(),
      'avatar': (avatar as MediaModel?)?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'birthDate': birthDate?.toIso8601String(),
      'lastSeen': lastSeen?.toIso8601String(),
      'deviceToken': deviceToken,
    };
  }
}
