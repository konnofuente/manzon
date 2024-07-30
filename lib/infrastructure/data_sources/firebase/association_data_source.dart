import 'dart:developer';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/infrastructure/models/member_model.dart';
import 'package:manzon/app/core/utils/constants/app_api_key.dart';
import 'package:manzon/infrastructure/models/association_model.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';
import 'package:manzon/infrastructure/data_sources/firebase/export_firebase_data_source.dart';

class AssociationDataSource {
  final associationRef = FirebaseFirestore.instance
      .collection(ApiKey.ASSOCIATION_KEY)
      .withConverter<AssociationModel>(
        fromFirestore: (snapshots, _) =>
            AssociationModel.fromJson(snapshots.data()!),
        toFirestore: (association, _) => association.toJson(),
      );

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserDataSource userDataSource = Get.find();

  Future<AssociationModel> addAssociation(
      AssociationModel associationModel) async {
    try {
      print('Adding association: ${associationModel.toJson()}');
      DocumentReference<AssociationModel> docRef =
          associationRef.doc(associationModel.uniqueId);
      await docRef.set(associationModel);

      // Retrieve the document to get the AssociationModel
      final doc = await docRef.get();

      // Convert the DocumentSnapshot to AssociationModel
      AssociationModel? model = doc.data();

      if (model != null) {
        return model;
      } else {
        throw Exception('Failed to retrieve association data.');
      }
    } catch (e) {
      print('Failed to add association: $e');
      rethrow;
    }
  }

  Future<void> addMember(String associationId, MemberModel member) async {
    try {
      final doc = await associationRef.doc(associationId).get();
      if (doc.exists) {
        final association = doc.data();
        if (association != null) {
          association.members.add(member);
          await associationRef.doc(associationId).update(
              {'members': association.members.map((e) => e.toJson()).toList()});
        }
      }
    } catch (e) {
      log('Failed to add member: $e'); // You can replace this with your preferred error logging method
      throw Exception('Failed to add member');
    }
  }




Future<List<AssociationModel>> getUserAssociations() async {
  try {
    String? userId = _firebaseAuth.currentUser?.uid;
    
    if (userId == null) {
      throw Exception('User ID is null');
    }

    final querySnapshot = await associationRef.where('membersId', arrayContains: userId).get();
    
    final userAssociations = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    
    log('this is the number of asso ${userAssociations.length}');
    
    return userAssociations;
  } catch (e) {
    print('Failed to get user associations: $e');
    return [];
  }
}


  Future<AssociationModel?> getAssociationById(String id) async {
    final doc = await associationRef.doc(id).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  Future<List<AssociationModel>> getAllAssociations() async {
    try {
      final querySnapshot = await associationRef.get();
      final associations = querySnapshot.docs.map((doc) => doc.data()).toList();
      log('Retrieved associations: ${associations.length}');
      return associations;
    } catch (e) {
      log('Failed to retrieve associations: $e');
      return [];
    }
  }

  Future<void> updateAssociation(AssociationModel associationModel) async {
    await associationRef
        .doc(associationModel.uniqueId)
        .update(associationModel.toJson());
  }

  Future<void> deleteAssociation(String id) async {
    await associationRef.doc(id).delete();
  }
}
