import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/repositories/auth_repository.dart';


class SignInWithPhoneNumberUseCase {
  final AuthenticationRepository _repository;

  SignInWithPhoneNumberUseCase(this._repository);

  Future<UserCredential> call(PhoneAuthCredential credential) async {
    try {
      return await _repository.signInWithPhoneAuthCredential(credential);
    } catch (e) {
      log('Error in signInWithPhoneAuthCredential: $e');
      throw Exception('Failed to sign in with phone number.');
    }
  }
}
