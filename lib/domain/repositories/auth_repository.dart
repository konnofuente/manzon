import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required void Function(PhoneAuthCredential credential) verificationCompleted,
    required void Function(FirebaseAuthException e) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  });

  Future<UserCredential> signInWithPhoneAuthCredential(PhoneAuthCredential credential);
}
