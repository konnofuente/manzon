import 'package:manzon/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> createUserEntity(UserEntity user);
  Future<UserEntity?> getUserEntityById(String id);
  Future<void> updateUserEntity(UserEntity user);
  Future<void> deleteUserEntity(String id);
}
