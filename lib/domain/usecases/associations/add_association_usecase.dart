import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/domain/repositories/association_repository.dart';

class AddAssociationUseCase {
  final AssociationRepository associationRepository;

  AddAssociationUseCase(this.associationRepository);

  Future<AssociationEntity> call(AssociationEntity association) async {
    return await associationRepository.addAssociation(association);
  }
}
