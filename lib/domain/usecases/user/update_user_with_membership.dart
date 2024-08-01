import 'package:manzon/domain/repositories/user_repository.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class UpdateUserWithMembership {
  final UserRepository userRepository;

  UpdateUserWithMembership(this.userRepository);

  Future<void> call(String userId, AssociationMembership associationMemberShip) async {
    await userRepository.updateUserWithMembership(userId,associationMemberShip);
  }
}
