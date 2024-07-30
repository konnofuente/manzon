import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/domain/repositories/association_repository.dart';

class AddMemberToAssociationUseCase {
  final AssociationRepository associationRepository;

  AddMemberToAssociationUseCase(this.associationRepository);

  Future<void> call(String associationId, MemberEntity member) async {
    await associationRepository.addMember(associationId, member);
  }
}
