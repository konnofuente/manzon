import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

abstract class AssociationRepository {
  Future<AssociationEntity> addAssociation(AssociationEntity association);
  Future<AssociationEntity?> getAssociationById(String id);
  Future<List<AssociationEntity>> getAllAssociations();
  Future<void> updateAssociation(AssociationEntity association);
  Future<void> deleteAssociation(String id);
   Future<void> addMember(String associationId, MemberEntity member);
}
