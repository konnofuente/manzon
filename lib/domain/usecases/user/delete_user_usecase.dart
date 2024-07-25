import 'package:manzon/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase(this.repository);

  Future<void> call(String id) async {
    // return await repository.deleteUser(id);
  }
}
