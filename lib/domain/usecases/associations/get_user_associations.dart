import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/domain/repositories/association_repository.dart';

class GetUserAssociationUseCase {
  final AssociationRepository associationRepository;

  GetUserAssociationUseCase(this.associationRepository);

  Future<List<AssociationEntity>> call() async {
    return await associationRepository.getUserAssociations();
  }
}
