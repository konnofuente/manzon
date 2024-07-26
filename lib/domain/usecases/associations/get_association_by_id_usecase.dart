import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/domain/repositories/association_repository.dart';

class GetAssociationByIdUseCase {
  final AssociationRepository associationRepository;

  GetAssociationByIdUseCase(this.associationRepository);

  Future<AssociationEntity?> call(String id) async {
    return await associationRepository.getAssociationById(id);
  }
}
