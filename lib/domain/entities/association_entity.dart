import 'package:equatable/equatable.dart';

class AssociationEntity extends Equatable {
  final String uniqueId;
  final String name;
  final String headquaterCity;
  final List<String> tontines;
  final List<String> meetingDays;
  final String paymentFrequency;
  final double balance;
  final String loanConditions;
  final List<String> transactions;
  final List<String> membersId;
  final String headquaterLocation;

  AssociationEntity({
    required this.uniqueId,
    required this.name,
    required this.headquaterCity,
    required this.tontines,
    required this.meetingDays,
    required this.paymentFrequency,
    required this.balance,
    required this.loanConditions,
    required this.transactions,
    required this.membersId,
    required this.headquaterLocation,
  });

  @override
  List<Object?> get props => [
        uniqueId,
        name,
        headquaterCity,
        tontines,
        meetingDays,
        paymentFrequency,
        balance,
        loanConditions,
        transactions,
        membersId,
        headquaterLocation,
      ];
}
