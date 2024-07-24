import 'package:manzon/domain/entities/media_entity.dart';
import 'package:manzon/domain/entities/enums/role_enum.dart';


class UserEntity {
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
}





