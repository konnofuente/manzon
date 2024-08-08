import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';




class TontineEntity extends Equatable {
  final String id;
  final String name;
  final double contributionAmount;
  final ContributionFrequency contributionFrequency;
  final ReceiverFrequency receiverFrequency;
  final List<MemberEntity>? members;
  final List<String>? membersId;
  final List<MemberEntity>? orderList;
  final List<CycleEntity>? cycles;
  final String associationId;
  final double? balance;
  final int cycleDuration;
  final List<String>? transactions;
  final int currentCycle;

  TontineEntity({
    required this.id,
    this.membersId,
    required this.name,
    required this.contributionAmount,
    required this.contributionFrequency,
    required this.receiverFrequency,
    required this.members,
    this.orderList,
    this.cycles,
    required this.associationId,
    this.balance,
    required this.cycleDuration,
    this.transactions,
    required this.currentCycle,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        contributionAmount,
        contributionFrequency,
        receiverFrequency,
        members,
        membersId,
        orderList,
        cycles,
        associationId,
        balance,
        cycleDuration,
        transactions,
        currentCycle,
      ];
}