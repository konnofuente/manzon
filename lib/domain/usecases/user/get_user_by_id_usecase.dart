import 'dart:developer';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/domain/repositories/user_repository.dart';


class GetUserByIdUseCase {
  final UserRepository repository;

  GetUserByIdUseCase(this.repository);

  Future<UserEntity?> call(String id) async {
    try {
      return await repository.getUserById(id);
    } catch (e) {
      log('Error in GetUserByIdUseCase: $e');
      throw Exception('Failed to get user by ID.');
    }
  }
}
