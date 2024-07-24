import 'package:manzon/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity user);
  Future<UserEntity?> getUserById(String id);
  // Add more methods as needed
}
