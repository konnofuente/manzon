import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/infrastructure/models/association_model.dart';

class AssociationDataSource {
  final associationRef = FirebaseFirestore.instance
      .collection('association')
      .withConverter<AssociationModel>(
        fromFirestore: (snapshots, _) =>
            AssociationModel.fromJson(snapshots.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  Future<void> addAssociation(AssociationModel associationModel) async {
    await associationRef
        .doc(associationModel.uniqueId)
        .set(associationModel);
  }

  Future<AssociationModel?> getAssociationById(String id) async {
    final doc = await associationRef.doc(id).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  Future<List<AssociationModel>> getAllAssociations() async {
    final querySnapshot = await associationRef.get();
    return querySnapshot.docs
        .map((doc) => doc.data())
        .toList();
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
