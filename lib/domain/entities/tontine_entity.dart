import 'cycle_entity.dart';
import 'member_entity.dart';
import 'package:equatable/equatable.dart';

class TontineEntity extends Equatable {
  final String id;
  final String name;
  final double contributionAmount;
  final String? contributionFrequency;
  final String? receiverFrequency;
  final List<MemberEntity>? members;
  final List<String>? membersId;
  final List<MemberEntity>? orderList;
  final List<CycleEntity>? cycles;
  final String associationId;
  final double? balance;
  final int cycleDuration;
  final List<String>? transactions;
  final int currentCycle;

  TontineEntity( {
    required this.id,
    this.membersId,
    required this.name,
    required this.contributionAmount,
    this.contributionFrequency,
    this.receiverFrequency,
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
