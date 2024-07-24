import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/repositories/auth_repository.dart';


class VerifyPhoneNumberUseCase {
  final AuthenticationRepository _authenticationRepository;

  VerifyPhoneNumberUseCase(this._authenticationRepository);

  Future<void> call(
    String phoneNumber, {
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(FirebaseAuthException e) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  }) {
    return _authenticationRepository.verifyPhoneNumber(
      phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}