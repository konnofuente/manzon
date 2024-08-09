import 'member_entity.dart';
import 'penalty_entity.dart';
import 'package:equatable/equatable.dart';
import 'tontine_contribution_entity.dart';

class CycleEntity extends Equatable {
  final String id;
  final int number;
  final int sequenceNumber;
  final String tontineId;
  final MemberEntity receiver;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCompleted;
  final List<TontineContributionEntity> contributions;
  final List<PenaltyEntity>? penalties; 

  CycleEntity({
    required this.id,
    required this.number,
    required this.sequenceNumber,
    required this.tontineId,
    required this.receiver,
    required this.startDate,
    required this.endDate,
    required this.isCompleted,
    required this.contributions,
    this.penalties ,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        sequenceNumber,
        tontineId,
        receiver,
        startDate,
        endDate,
        isCompleted,
        contributions,
        penalties 
      ];
}
