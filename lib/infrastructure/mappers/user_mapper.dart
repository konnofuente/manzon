import 'media_mapper.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/infrastructure/models/user_model.dart';

class UserMapper {
  static UserModel toModel(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      phoneNumber: userEntity.phoneNumber,
      name: userEntity.name,
      associations: userEntity.associations,
      isAdministrator: userEntity.isAdministrator,
      avatar: userEntity.avatar != null ? MediaMapper.toModel(userEntity.avatar!) : null,
      createdAt: userEntity.createdAt,
      updatedAt: userEntity.updatedAt,
      birthDate: userEntity.birthDate,
      lastSeen: userEntity.lastSeen,
      deviceToken: userEntity.deviceToken,
    );
  }

  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      phoneNumber: userModel.phoneNumber,
      name: userModel.name,
      associations: userModel.associations, 
      isAdministrator: userModel.isAdministrator,
      avatar: userModel.avatar,
      createdAt: userModel.createdAt,
      updatedAt: userModel.updatedAt,
      birthDate: userModel.birthDate,
      lastSeen: userModel.lastSeen,
      deviceToken: userModel.deviceToken,
    ); 
  }
}
