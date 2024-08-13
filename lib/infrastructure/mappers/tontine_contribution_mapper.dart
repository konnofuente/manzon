import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/domain/entities/tontine_contribution_entity.dart';
import 'package:manzon/infrastructure/models/tontine_contribution_model.dart';

class TontineContributionMapper {
  static TontineContributionModel toModel(TontineContributionEntity entity) {
    return TontineContributionModel(
      id: entity.id,
      member: MemberMapper.toModel(entity.member),
      amount: entity.amount,
      date: entity.date,
      status: entity.status,
    );
  }

  static TontineContributionEntity toEntity(TontineContributionModel model) {
    return TontineContributionEntity(
      id: model.id,
      member: MemberMapper.toModel(model.member),
      amount: model.amount,
      date: model.date,
      status: model.status,
    );
  }
}
