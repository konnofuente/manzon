import 'member_model.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';


class TontineContributionModel extends TontineContributionEntity {
  TontineContributionModel({
    required String id,
    required MemberModel member,
    required double amount,
    required DateTime date,
    required String status,
  }) : super(
          id: id,
          member: member,
          amount: amount,
          date: date,
          status: status,
        );

  factory TontineContributionModel.fromJson(Map<String, dynamic> json) {
    return TontineContributionModel(
      id: json['id'],
      member: MemberModel.fromJson(json['member']),
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'member': (member as MemberModel).toJson(),
      'amount': amount,
      'date': date.toIso8601String(),
      'status': status,
    };
  }
}
