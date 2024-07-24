import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/domain/entities/user_entity.dart';
import 'package:manzon/infrastructure/models/user_modal.dart';

class UserDataSource {
  final userRef = FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
    fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
    toFirestore: (user, _) => user.toJson(),
  );

  Future<void> addUser(UserModel userModel) async {
    await userRef.doc(userModel.id).set(userModel);
  }

  Future<UserEntity?> getUserById(String id) async {
    final doc = await userRef.doc(id).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  // Add more methods as needed
}
