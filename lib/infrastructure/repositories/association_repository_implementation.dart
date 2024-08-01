import 'package:manzon/domain/entities/member_entity.dart';
import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/infrastructure/mappers/association_mapper.dart';
import 'package:manzon/domain/repositories/association_repository.dart';
import 'package:manzon/infrastructure/data_sources/firebase/association_data_source.dart';

class AssociationRepositoryImpl implements AssociationRepository {
  final AssociationDataSource associationDataSource;

  AssociationRepositoryImpl(this.associationDataSource);

  @override
  Future<AssociationEntity> addAssociation(
      AssociationEntity association) async {
    final model = AssociationMapper.toModel(association);
    final createdModel = await associationDataSource.addAssociation(model);
    return AssociationMapper.toEntity(createdModel);
  }

  @override
  Future<AssociationEntity?> getAssociationById(String id) async {
    final associationModel = await associationDataSource.getAssociationById(id);
    if (associationModel != null) {
      return AssociationMapper.toEntity(associationModel);
    }
    return null;
  }

  @override
  Future<List<AssociationEntity>> getAllAssociations() async {
    final associationModels = await associationDataSource.getAllAssociations();
    return associationModels
        .map((model) => AssociationMapper.toEntity(model))
        .toList();
  }

  @override
  Future<void> updateAssociation(AssociationEntity association) async {
    await associationDataSource
        .updateAssociation(AssociationMapper.toModel(association));
  }

  @override
  Future<void> deleteAssociation(String id) async {
    await associationDataSource.deleteAssociation(id);
  }

  @override
  Future<void> addMember(String associationId, MemberEntity member) async {
    await associationDataSource.addMember(
        associationId, MemberMapper.toModel(member));
    // throw UnimplementedError();
  }

  @override
  Future<List<AssociationEntity>> getUserAssociations() async {
    final associationModels = await associationDataSource.getUserAssociations();

    return associationModels
        .map((model) => AssociationMapper.toEntity(model))
        .toList();
  }
}
