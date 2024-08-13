import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/infrastructure/mappers/cycle_mapper.dart';
import 'package:manzon/infrastructure/models/tontine_model.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';

class TontineMapper {
  static TontineModel toModel(TontineEntity entity) {
    return TontineModel(
      id: entity.id,
      name: entity.name,
      contributionAmount: entity.contributionAmount,
      contributionFrequency: entity.contributionFrequency,
      receiverFrequency: entity.receiverFrequency,
      members: entity.members?.map((e) => MemberMapper.toModel(e)).toList(),
      membersId: entity.membersId,
      orderList: entity.orderList?.map((e) => MemberMapper.toModel(e)).toList(),
      cycles: entity.cycles?.map((e) => CycleMapper.toModel(e)).toList(),
      associationId: entity.associationId,
      balance: entity.balance,
      cycleDuration: entity.cycleDuration,
      transactions: entity.transactions,
      currentCycle: entity.currentCycle,
    );
  }

  static TontineEntity toEntity(TontineModel model) {
    return TontineEntity(
      id: model.id,
      name: model.name,
      contributionAmount: model.contributionAmount,
      contributionFrequency: model.contributionFrequency,
      receiverFrequency: model.receiverFrequency,
      members: model.members?.map((e) => MemberMapper.toModel(e)).toList(),
      membersId: model.membersId,
      orderList: model.orderList?.map((e) => MemberMapper.toModel(e)).toList(),
      cycles: model.cycles?.map((e) => CycleMapper.toModel(e)).toList(),
      associationId: model.associationId,
      balance: model.balance,
      cycleDuration: model.cycleDuration,
      transactions: model.transactions,
      currentCycle: model.currentCycle,
    );
  }
}
