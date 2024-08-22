import 'member_entity.dart';
import 'package:equatable/equatable.dart';

class PenaltyEntity extends Equatable {
  final MemberEntity member;
  final String cycleId;
  final double penaltyAmount;

  PenaltyEntity({
    required this.member,
    required this.cycleId,
    required this.penaltyAmount,
  });

  @override
  List<Object?> get props => [member, cycleId, penaltyAmount];
}
