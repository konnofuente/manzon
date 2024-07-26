import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/infrastructure/models/association_model.dart';
import 'package:manzon/domain/repositories/association_repository.dart';

class AssociationRepositoryImpl implements AssociationRepository {
  final FirebaseFirestore firestore;

  AssociationRepositoryImpl(this.firestore);

  @override
  Future<void> addAssociation(AssociationEntity association) async {
    final associationModel = AssociationModel(
      uniqueId: association.uniqueId,
      name: association.name,
      headquaterCity: association.headquaterCity,
      tontines: association.tontines,
      meetingDays: association.meetingDays,
      paymentFrequency: association.paymentFrequency,
      balance: association.balance,
      loanConditions: association.loanConditions,
      transactions: association.transactions,
      membersId: association.membersId,
      headquaterLocation: association.headquaterLocation,
    );
    await firestore
        .collection('associations')
        .doc(association.uniqueId)
        .set(associationModel.toJson());
  }

  @override
  Future<AssociationEntity?> getAssociationById(String id) async {
    final doc = await firestore.collection('associations').doc(id).get();
    if (doc.exists) {
      return AssociationModel.fromJson(doc.data()!);
    }
    return null;
  }

  @override
  Future<List<AssociationEntity>> getAllAssociations() async {
    final querySnapshot = await firestore.collection('associations').get();
    return querySnapshot.docs
        .map((doc) => AssociationModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<void> updateAssociation(AssociationEntity association) async {
    final associationModel = AssociationModel(
      uniqueId: association.uniqueId,
      name: association.name,
      headquaterCity: association.headquaterCity,
      tontines: association.tontines,
      meetingDays: association.meetingDays,
      paymentFrequency: association.paymentFrequency,
      balance: association.balance,
      loanConditions: association.loanConditions,
      transactions: association.transactions,
      membersId: association.membersId,
      headquaterLocation: association.headquaterLocation,
    );
    await firestore
        .collection('associations')
        .doc(association.uniqueId)
        .update(associationModel.toJson());
  }

  @override
  Future<void> deleteAssociation(String id) async {
    await firestore.collection('associations').doc(id).delete();
  }
}
