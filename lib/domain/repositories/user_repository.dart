import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

abstract class UserRepository {
  Future<void> addUser(UserEntity user);
  
  Future<UserEntity?> getUserById(String id);

   Future<void> updateUser(UserEntity user);

   Future<void> updateUserWithMembership(String userId, AssociationMembership associationMemberShip);
}
