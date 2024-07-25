import 'package:firebase_auth/firebase_auth.dart';
import 'package:manzon/domain/repositories/auth_repository.dart';
import 'package:manzon/infrastructure/data_sources/firebase/auth_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImpl(this._authenticationDataSource);

  @override
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(FirebaseAuthException e) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  }) async {
    await _authenticationDataSource.verifyPhoneNumber(
      phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<UserCredential> signInWithPhoneAuthCredential(PhoneAuthCredential credential) async {
    return await _authenticationDataSource.signInWithPhoneAuthCredential(credential);
  }
}
