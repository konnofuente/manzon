import 'package:manzon/domain/entities/export_domain_entities.dart';


class TontineModel extends TontineEntity {
  TontineModel({
    String? uniqueId,
    required String name,
    required String associationId,
    required List<String> members,
    required double balance,
    required String contributionFrequency,
    required double contributionAmount,
    required int cycleDuration,
    required int currentCycle,
    required List<String> transactions,
  }) : super(
          uniqueId: uniqueId,
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

  factory TontineModel.fromJson(Map<String, dynamic> json) {
    return TontineModel(
      uniqueId: json['uniqueId'],
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
      'uniqueId': uniqueId,
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
