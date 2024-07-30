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
  final List<String>? membersId;
  final String? headquaterLocation;
  final MediaEntity? avatar;
  final List<MemberEntity> members; // Updated field for detailed member list
  final List<String> adminIds; // New field for admin IDs

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
    this.avatar,
    required this.members, // Initialize in the constructor
    required this.adminIds, // Initialize in the constructor
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
        avatar,
        members, // Add this line
        adminIds, // Add this line
      ];
}
