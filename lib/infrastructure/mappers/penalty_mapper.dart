import 'package:manzon/infrastructure/mappers/cycle_mapper.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';

class PenaltyMapper {
  static PenaltyModel toModel(PenaltyEntity entity) {
    return PenaltyModel(
      member: MemberMapper.toModel(entity.member),
      cycle: CycleMapper.toModel(entity.cycle)  ,
      penaltyAmount:
          entity.penaltyAmount, 
    );
  }

  static PenaltyEntity toEntity(PenaltyModel model) {
    return PenaltyEntity(
      member: model.member,
      cycle: model.cycle,
      penaltyAmount: model.penaltyAmount,
    );
  }
}
