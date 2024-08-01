import '../../domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';



class TontineMapper {
  static TontineModel toModel(TontineEntity tontineEntity) {
    return TontineModel(
      uniqueId: tontineEntity.uniqueId,
      name: tontineEntity.name,
      associationId: tontineEntity.associationId,
      members: tontineEntity.members,
      balance: tontineEntity.balance,
      contributionFrequency: tontineEntity.contributionFrequency,
      contributionAmount: tontineEntity.contributionAmount,
      cycleDuration: tontineEntity.cycleDuration,
      currentCycle: tontineEntity.currentCycle,
      transactions: tontineEntity.transactions,
    );
  }

  static TontineEntity toEntity(TontineModel tontineModel) {
    return TontineEntity(
      uniqueId: tontineModel.uniqueId,
      name: tontineModel.name,
      associationId: tontineModel.associationId,
      members: tontineModel.members,
      balance: tontineModel.balance,
      contributionFrequency: tontineModel.contributionFrequency,
      contributionAmount: tontineModel.contributionAmount,
      cycleDuration: tontineModel.cycleDuration,
      currentCycle: tontineModel.currentCycle,
      transactions: tontineModel.transactions,
    );
  }
}