import 'package:manzon/infrastructure/models/media_model.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';


class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String phoneNumber,
    String? name,
    List<AssociationMembership>? associations,
    bool isAdministrator = false,
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
          isAdministrator: isAdministrator,
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
          ?.map((e) => AssociationMembership.fromJson(e))
          .toList(),
      isAdministrator: json['isAdministrator'],
      avatar: json['avatar'] != null ? MediaModel.fromJson(json['avatar']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      lastSeen: json['lastSeen'] != null ? DateTime.parse(json['lastSeen']) : null,
      deviceToken: json['deviceToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'associations': associations?.map((e) => e.toJson()).toList(),
      'isAdministrator': isAdministrator,
      'avatar': avatar?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'birthDate': birthDate?.toIso8601String(),
      'lastSeen': lastSeen?.toIso8601String(),
      'deviceToken': deviceToken,
    };
  }
}