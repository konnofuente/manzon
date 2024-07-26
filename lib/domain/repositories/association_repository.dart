import 'package:manzon/domain/entities/association_entity.dart';

abstract class AssociationRepository {
  Future<void> addAssociation(AssociationEntity association);
  Future<AssociationEntity?> getAssociationById(String id);
  Future<List<AssociationEntity>> getAllAssociations();
  Future<void> updateAssociation(AssociationEntity association);
  Future<void> deleteAssociation(String id);
}
