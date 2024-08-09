import 'cycle_model.dart';
import 'member_model.dart';
import 'package:manzon/domain/entities/penalty_entity.dart';

class PenaltyModel extends PenaltyEntity {
  PenaltyModel({
    required MemberModel member,
    required CycleModel cycle,
    required double penaltyAmount,
  }) : super(
          member: member,
          cycle: cycle,
          penaltyAmount: penaltyAmount,
        );

  factory PenaltyModel.fromJson(Map<String, dynamic> json) {
    return PenaltyModel(
      member: MemberModel.fromJson(json['member']),
      cycle: CycleModel.fromJson(json['cycle']),
      penaltyAmount: json['penaltyAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'member': (member as MemberModel).toJson(),
      'cycle': (cycle as CycleModel).toJson(),
      'penaltyAmount': penaltyAmount,
    };
  }
}
