import 'package:manzon/domain/entities/association_entity.dart';

class AssociationModel extends AssociationEntity {
  AssociationModel({
    required String uniqueId,
    required String name,
    required String headquaterCity,
    required List<String> tontines,
    required List<String> meetingDays,
    required String paymentFrequency,
    required double balance,
    required String loanConditions,
    required List<String> transactions,
    required List<String> membersId,
    required String headquaterLocation,
  }) : super(
          uniqueId: uniqueId,
          name: name,
          headquaterCity: headquaterCity,
          tontines: tontines,
          meetingDays: meetingDays,
          paymentFrequency: paymentFrequency,
          balance: balance,
          loanConditions: loanConditions,
          transactions: transactions,
          membersId: membersId,
          headquaterLocation: headquaterLocation,
        );

  factory AssociationModel.fromJson(Map<String, dynamic> json) {
    return AssociationModel(
      uniqueId: json['uniqueId'],
      name: json['name'],
      headquaterCity: json['headquaterCity'],
      tontines: List<String>.from(json['tontines']),
      meetingDays: List<String>.from(json['meetingDays']),
      paymentFrequency: json['paymentFrequency'],
      balance: json['balance'].toDouble(),
      loanConditions: json['loanConditions'],
      transactions: List<String>.from(json['transactions']),
      membersId: List<String>.from(json['membersId']),
      headquaterLocation: json['headquaterLocation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uniqueId': uniqueId,
      'name': name,
      'headquaterCity': headquaterCity,
      'tontines': tontines,
      'meetingDays': meetingDays,
      'paymentFrequency': paymentFrequency,
      'balance': balance,
      'loanConditions': loanConditions,
      'transactions': transactions,
      'membersId': membersId,
      'headquaterLocation': headquaterLocation,
    };
  }
}
