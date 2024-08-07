import 'package:manzon/domain/entities/cycle_entity.dart';
import 'package:manzon/infrastructure/models/cycle_model.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/infrastructure/mappers/tontine_contribution_mapper.dart';

class CycleMapper {
  static CycleModel toModel(CycleEntity entity) {
    return CycleModel(
      id: entity.id,
      number: entity.number,
      sequenceNumber: entity.sequenceNumber,
      tontineId: entity.tontineId,
      receiver: MemberMapper.toModel(entity.receiver),
      startDate: entity.startDate,
      endDate: entity.endDate,
      isCompleted: entity.isCompleted,
      contributions: entity.contributions.map((e) => TontineContributionMapper.toModel(e)).toList(),
    );
  }

  static CycleEntity toEntity(CycleModel model) {
    return CycleEntity(
      id: model.id,
      number: model.number,
      sequenceNumber: model.sequenceNumber,
      tontineId: model.tontineId,
      receiver: MemberMapper.toModel(model.receiver),
      startDate: model.startDate,
      endDate: model.endDate,
      isCompleted: model.isCompleted,
      contributions: model.contributions.map((e) => TontineContributionMapper.toModel(e)).toList(),
    );
  }
}
