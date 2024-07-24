import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/infrastructure/models/user_model.dart';

class UserDataSource {
  final userRef = FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
    fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
    toFirestore: (user, _) => user.toJson(),
  );

  Future<void> addUser(UserModel userModel) async {
    await userRef.doc(userModel.id).set(userModel);
  }

  Future<UserModel?> getUserById(String id) async {
    final doc = await userRef.doc(id).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  // Add more methods as needed
}
