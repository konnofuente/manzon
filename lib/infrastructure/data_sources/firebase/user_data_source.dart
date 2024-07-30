import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/infrastructure/models/user_model.dart';
import 'package:manzon/infrastructure/mappers/export_mapper.dart';
import 'package:manzon/app/core/utils/constants/app_api_key.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class UserDataSource {
  final userRef = FirebaseFirestore.instance.collection(ApiKey.USER_KEY).withConverter<UserModel>(
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

  Future<void> updateUser(UserModel userModel) async {
    await userRef.doc(userModel.id).set(userModel);
  }

Future<void> updateUserWithMembership(String userId, AssociationMembership associationMembership) async {
  try {
    // Fetch existing user data
    final user = await getUserById(userId);
    if (user == null) {
      throw Exception('User not found');
    }
    final updatedAssociations = user.associations ?? [];
     updatedAssociations.add(associationMembership);

    final isAdministrator = associationMembership.role == Role.admin;

    final Map<String, dynamic> updates = {
      'associations': updatedAssociations.map((e) => e.toJson()).toList(),
      if (isAdministrator) 'isAdministrator': true,
      'updatedAt': DateTime.now().toIso8601String(),
    };

    await userRef.doc(userId).update(updates);
  } catch (e) {
    log('Failed to update user with membership: $e');
    throw Exception('Failed to update user with membership');
  }
}


}
