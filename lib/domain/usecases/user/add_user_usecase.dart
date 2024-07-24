import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/repositories/user_repository.dart';

class AddUserUseCase {
  final UserRepository repository;

  AddUserUseCase(this.repository);

  Future<void> call(UserEntity user) async {
    try {
      return await repository.addUser(user);
    } catch (e) {
      print('Error in AddUserUseCase: $e');
      throw Exception('Failed to add user.');
    }
  }
}
