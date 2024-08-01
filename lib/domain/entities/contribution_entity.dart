import 'package:equatable/equatable.dart';

class ContributionEntity extends Equatable {
  final String id;
  final String name;
  final String associationId;
  final List<String> members;
  final double balance;
  final String contributionFrequency;
  final double contributionAmount;
  final String cycleDuration;
  final int currentCycle;
  final List<String> transactions;

  ContributionEntity({
    required this.id,
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
        id,
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
