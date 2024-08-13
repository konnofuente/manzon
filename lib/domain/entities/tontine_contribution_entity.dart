import 'member_entity.dart';
import 'package:equatable/equatable.dart';

class TontineContributionEntity extends Equatable {
  final String id;
  final MemberEntity member;
  final double amount;
  final DateTime date;
  final String status;

  TontineContributionEntity({
    required this.id,
    required this.member,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props => [id, member, amount, date, status];
}
