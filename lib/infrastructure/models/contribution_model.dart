import 'package:manzon/domain/entities/export_domain_entities.dart';

class AssociationContributionModel extends AssociationContributionEntity {
  AssociationContributionModel({
    required String id,
    required String name,
    required String associationId,
    required List<String> members,
    required double balance,
    required String contributionFrequency,
    required double contributionAmount,
    required String cycleDuration,
    required int currentCycle,
    required List<String> transactions,
  }) : super(
          id: id,
          name: name,
          associationId: associationId,
          members: members,
          balance: balance,
          contributionFrequency: contributionFrequency,
          contributionAmount: contributionAmount,
          cycleDuration: cycleDuration,
          currentCycle: currentCycle,
          transactions: transactions,
        );

  factory AssociationContributionModel.fromJson(Map<String, dynamic> json) {
    return AssociationContributionModel(
      id: json['id'],
      name: json['name'],
      associationId: json['associationId'],
      members: List<String>.from(json['members']),
      balance: (json['balance'] as num).toDouble(),
      contributionFrequency: json['contributionFrequency'],
      contributionAmount: (json['contributionAmount'] as num).toDouble(),
      cycleDuration: json['cycleDuration'],
      currentCycle: json['currentCycle'],
      transactions: List<String>.from(json['transactions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'associationId': associationId,
      'members': members,
      'balance': balance,
      'contributionFrequency': contributionFrequency,
      'contributionAmount': contributionAmount,
      'cycleDuration': cycleDuration,
      'currentCycle': currentCycle,
      'transactions': transactions,
    };
  }
}
