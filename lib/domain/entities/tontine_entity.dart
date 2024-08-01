import 'package:equatable/equatable.dart';

class TontineEntity extends Equatable {
  final String? uniqueId;
  final String name;
  final String associationId;
  final List<String> members;
  final double balance;
  final String contributionFrequency;
  final double contributionAmount;
  final int cycleDuration;
  final int currentCycle;
  final List<String> transactions;

  TontineEntity({
    this.uniqueId,
    required this.name,
    required this.associationId,
    required this.members,
    required this.balance,
    required this.contributionFrequency,
    required this.contributionAmount,
    required this.cycleDuration,
    required this.currentCycle,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
        uniqueId,
        name,
        associationId,
        members,
        balance,
        contributionFrequency,
        contributionAmount,
        cycleDuration,
        currentCycle,
        transactions,
      ];
}