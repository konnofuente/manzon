import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/infrastructure/mappers/association_mapper.dart';
import 'package:manzon/domain/repositories/association_repository.dart';
import 'package:manzon/infrastructure/data_sources/firebase/association_data_source.dart';

class AssociationRepositoryImpl implements AssociationRepository {
  final AssociationDataSource associationDataSource;

  AssociationRepositoryImpl(this.associationDataSource);

  @override
  Future<void> addAssociation(AssociationEntity association) async {
    await associationDataSource.addAssociation(
        AssociationMapper.toModel(association));
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
    return associationModels.map((model) => AssociationMapper.toEntity(model)).toList();
  }

  @override
  Future<void> updateAssociation(AssociationEntity association) async {
    await associationDataSource.updateAssociation(
        AssociationMapper.toModel(association));
  }

  @override
  Future<void> deleteAssociation(String id) async {
    await associationDataSource.deleteAssociation(id);
  }
}
