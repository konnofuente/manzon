import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase(this.repository);

  Future<void> call(UserEntity user) async {
    // return await repository.updateUser(user);
  }
}
