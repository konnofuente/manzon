import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/infrastructure/models/user_model.dart';
import 'package:manzon/infrastructure/models/media_model.dart';
import 'package:manzon/domain/repositories/user_repository.dart';
import 'package:manzon/infrastructure/data_sources/firebase/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<void> addUser(UserEntity user) async {
    final userModel = UserModel(
      id: user.id,
      phoneNumber: user.phoneNumber,
      name: user.name,
      associations: user.associations,
      roles: user.roles,
      avatar: user.avatar != null ? MediaModel.fromJson(user.avatar!.toJson()) : null,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      birthDate: user.birthDate,
      lastSeen: user.lastSeen,
      deviceToken: user.deviceToken,
    );
    await _userDataSource.addUser(userModel);
  }

  @override
  Future<UserModel?> getUserById(String id) async {
    final userModel = await _userDataSource.getUserById(id);
    if (userModel != null) {
      return UserModel(
        id: userModel.id,
        phoneNumber: userModel.phoneNumber,
        name: userModel.name,
        associations: userModel.associations,
        roles: userModel.roles,
        avatar: userModel.avatar != null ? MediaModel(
          link: userModel.avatar!.link,
          type: userModel.avatar!.type,
          createdAt: userModel.avatar!.createdAt,
          updatedAt: userModel.avatar!.updatedAt,
          mediaId: userModel.avatar!.mediaId,
        ) : null,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
        birthDate: userModel.birthDate,
        lastSeen: userModel.lastSeen,
        deviceToken: userModel.deviceToken,
      );
    }
    return null;
  }

  // Add more methods as needed
}
