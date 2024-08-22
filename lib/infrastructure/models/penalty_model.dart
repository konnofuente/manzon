import 'member_model.dart';
import 'package:manzon/domain/entities/penalty_entity.dart';

class PenaltyModel extends PenaltyEntity {
  PenaltyModel({
    required MemberModel member,
    required String cycleId, 
    required double penaltyAmount,
  }) : super(
          member: member,
          cycleId: cycleId,
          penaltyAmount: penaltyAmount,
        );

  factory PenaltyModel.fromJson(Map<String, dynamic> json) {
    return PenaltyModel(
      member: MemberModel.fromJson(json['member']),
      cycleId: json['cycleId'], // Directly use the cycle ID from JSON
      penaltyAmount: json['penaltyAmount'].toDouble(), // Ensure proper type conversion
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'member': (member as MemberModel).toJson(),
      'cycleId': cycleId, // Save only the cycle ID
      'penaltyAmount': penaltyAmount,
    };
  }
}
