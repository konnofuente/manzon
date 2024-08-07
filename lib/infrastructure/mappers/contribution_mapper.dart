import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';

class ContributionMapper {
  static AssociationContributionModel toModel(
      AssociationContributionEntity contributionEntity) {
    return AssociationContributionModel(
      id: contributionEntity.id,
      name: contributionEntity.name,
      associationId: contributionEntity.associationId,
      members: contributionEntity.members,
      balance: contributionEntity.balance,
      contributionFrequency: contributionEntity.contributionFrequency,
      contributionAmount: contributionEntity.contributionAmount,
      cycleDuration: contributionEntity.cycleDuration,
      currentCycle: contributionEntity.currentCycle,
      transactions: contributionEntity.transactions,
    );
  }

  static AssociationContributionEntity toEntity(
      AssociationContributionModel contributionModel) {
    return AssociationContributionEntity(
      id: contributionModel.id,
      name: contributionModel.name,
      associationId: contributionModel.associationId,
      members: contributionModel.members,
      balance: contributionModel.balance,
      contributionFrequency: contributionModel.contributionFrequency,
      contributionAmount: contributionModel.contributionAmount,
      cycleDuration: contributionModel.cycleDuration,
      currentCycle: contributionModel.currentCycle,
      transactions: contributionModel.transactions,
    );
  }
}
