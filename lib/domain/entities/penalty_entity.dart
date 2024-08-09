import 'cycle_entity.dart';
import 'member_entity.dart';
import 'package:equatable/equatable.dart';

class PenaltyEntity extends Equatable {
  final MemberEntity member;
  final CycleEntity cycle;
  final double penaltyAmount;

  PenaltyEntity({
    required this.member,
    required this.cycle,
    required this.penaltyAmount,
  });

  @override
  List<Object?> get props => [member, cycle, penaltyAmount];
}
