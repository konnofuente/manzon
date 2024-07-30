import 'package:equatable/equatable.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

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
  final List<String>? membersId; // Updated field for member IDs
  final String? headquaterLocation;
  final MediaEntity? avatar;
  final List<MemberEntity> members; // Updated field for detailed member list

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
    this.membersId, // Initialize in the constructor
    this.headquaterLocation,
    this.avatar,
    required this.members, // Initialize in the constructor
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
        membersId, // Add this line
        headquaterLocation,
        avatar,
        members, // Add this line
      ];
}
