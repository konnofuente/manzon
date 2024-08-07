import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';


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
        contributions
      ];
}
