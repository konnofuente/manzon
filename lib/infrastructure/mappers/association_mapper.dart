import 'package:manzon/domain/entities/association_entity.dart';
import 'package:manzon/infrastructure/models/association_model.dart';

class AssociationMapper {
  static AssociationModel toModel(AssociationEntity entity) {
    return AssociationModel(
      uniqueId: entity.uniqueId,
      name: entity.name,
      headquaterCity: entity.headquaterCity,
      tontines: entity.tontines,
      meetingDays: entity.meetingDays,
      paymentFrequency: entity.paymentFrequency,
      monthlyMeetingFrequency: entity.monthlyMeetingFrequency,
      balance: entity.balance,
      loanConditions: entity.loanConditions,
      transactions: entity.transactions,
      members: entity.members,
      adminIds: entity.adminIds,
      headquaterLocation: entity.headquaterLocation,
      avatar: entity.avatar,
    );
  }

  static AssociationEntity toEntity(AssociationModel model) {
    return AssociationEntity(
      uniqueId: model.uniqueId,
      name: model.name,
      headquaterCity: model.headquaterCity,
      tontines: model.tontines,
      meetingDays: model.meetingDays,
      paymentFrequency: model.paymentFrequency,
      monthlyMeetingFrequency: model.monthlyMeetingFrequency,
      balance: model.balance,
      loanConditions: model.loanConditions,
      transactions: model.transactions,
      members: model.members,
      adminIds: model.adminIds,
      headquaterLocation: model.headquaterLocation,
      avatar: model.avatar,
    );
  }
}
