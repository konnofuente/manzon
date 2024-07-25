import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/domain/entities/enums/role_enum.dart';

class UserEntity extends Equatable {
  final String id;
  final String phoneNumber;
  final String? name;
  final List<String>? associations;
  final List<Role>? roles;
  final MediaEntity? avatar;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? birthDate;
  final DateTime? lastSeen;
  final String? deviceToken;

  UserEntity({
    required this.id,
    required this.phoneNumber,
    this.name,
    this.associations,
    this.roles,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.birthDate,
    this.lastSeen,
    this.deviceToken,
  });

  @override
  List<Object?> get props => [
    id,
    phoneNumber,
    name,
    associations,
    roles,
    avatar,
    createdAt,
    updatedAt,
    birthDate,
    lastSeen,
    deviceToken,
  ];

  // JSON serialization
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      associations: (json['associations'] as List<dynamic>?)?.cast<String>(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.values.firstWhere((r) => r.toString() == 'Role.$e'))
          .toList(),
      avatar: json['avatar'] != null ? MediaEntity.fromJson(json['avatar']) : null,
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
      'associations': associations,
      'roles': roles?.map((e) => e.toString().split('.').last).toList(),
      'avatar': avatar?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'birthDate': birthDate?.toIso8601String(),
      'lastSeen': lastSeen?.toIso8601String(),
      'deviceToken': deviceToken,
    };
  }
}
