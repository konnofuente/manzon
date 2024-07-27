import 'package:equatable/equatable.dart';
import 'media_entity.dart'; // Ensure the correct path is used

class AssociationEntity extends Equatable {
  final String? uniqueId;
  final String name;
  final String? headquaterCity;
  final List<String>? tontines;
  final List<String>? meetingDays;
  final String? paymentFrequency;
  final int? monthlyMeetingFrequency;
  final double? balance;
  final String? loanConditions;
  final List<String>? transactions;
  final List<String>? membersId;
  final String? headquaterLocation;
  final MediaEntity? avatar; // Updated this line

  AssociationEntity({
    this.uniqueId,
    required this.name,
    this.headquaterCity,
    this.tontines,
    this.meetingDays,
    this.paymentFrequency,
    this.monthlyMeetingFrequency,
    this.balance,
    this.loanConditions,
    this.transactions,
    this.membersId,
    this.headquaterLocation,
    this.avatar, // Updated this line
  });

  @override
  List<Object?> get props => [
        uniqueId,
        name,
        headquaterCity,
        tontines,
        meetingDays,
        paymentFrequency,
        monthlyMeetingFrequency,
        balance,
        loanConditions,
        transactions,
        membersId,
        headquaterLocation,
        avatar, // Updated this line
      ];
}
