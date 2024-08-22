import 'package:manzon/infrastructure/mappers/cycle_mapper.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';

class PenaltyMapper {
  static PenaltyModel toModel(PenaltyEntity entity) {
    return PenaltyModel(
      member: MemberMapper.toModel(entity.member),
      cycleId: entity.cycleId  ,
      penaltyAmount:
          entity.penaltyAmount, 
    );
  }

  static PenaltyEntity toEntity(PenaltyModel model) {
    return PenaltyEntity(
      member: model.member,
      cycleId: model.cycleId,
      penaltyAmount: model.penaltyAmount,
    );
  }
}
