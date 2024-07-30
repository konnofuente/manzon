import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository userRepository;

  UpdateUserUseCase(this.userRepository);

  Future<void> call(UserEntity user) async {
    await userRepository.updateUser(user);
  }
}
