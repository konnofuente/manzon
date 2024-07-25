import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/infrastructure/models/user_model.dart';
import 'package:manzon/infrastructure/models/media_model.dart';
import 'package:manzon/infrastructure/mappers/user_mapper.dart';
import 'package:manzon/domain/repositories/user_repository.dart';
import 'package:manzon/infrastructure/data_sources/firebase/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<void> addUser(UserEntity user) async {
    final userModel = UserMapper.toModel(user);
    await _userDataSource.addUser(userModel);
  }

  @override
  Future<UserModel?> getUserById(String id) async {
    final userModel = await _userDataSource.getUserById(id);
    if (userModel != null) {
      return userModel;
    }
    return null;
  }

}
