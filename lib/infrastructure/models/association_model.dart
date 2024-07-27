import '../../domain/entities/export_domain_entities.dart';
import 'package:manzon/domain/entities/association_entity.dart';

class AssociationModel extends AssociationEntity {
  AssociationModel({
    String? uniqueId,
    required String name,
    String? headquaterCity,
    List<String>? tontines,
    List<String>? meetingDays,
    String? paymentFrequency,
    int? monthlyMeetingFrequency,
    double? balance,
    String? loanConditions,
    List<String>? transactions,
    List<String>? membersId,
    String? headquaterLocation,
    MediaEntity? avatar, // Updated this line
  }) : super(
          uniqueId: uniqueId,
          name: name,
          headquaterCity: headquaterCity,
          tontines: tontines,
          meetingDays: meetingDays,
          paymentFrequency: paymentFrequency,
          monthlyMeetingFrequency: monthlyMeetingFrequency,
          balance: balance,
          loanConditions: loanConditions,
          transactions: transactions,
          membersId: membersId,
          headquaterLocation: headquaterLocation,
          avatar: avatar, // Updated this line
        );

  factory AssociationModel.fromJson(Map<String, dynamic> json) {
    return AssociationModel(
      uniqueId: json['uniqueId'],
      name: json['name'],
      headquaterCity: json['headquaterCity'],
      tontines: List<String>.from(json['tontines']),
      meetingDays: List<String>.from(json['meetingDays']),
      paymentFrequency: json['paymentFrequency'],
      monthlyMeetingFrequency: json['monthlyMeetingFrequency'],
      balance: (json['balance'] as num).toDouble(),
      loanConditions: json['loanConditions'],
      transactions: List<String>.from(json['transactions']),
      membersId: List<String>.from(json['membersId']),
      headquaterLocation: json['headquaterLocation'],
      avatar: MediaEntity.fromJson(json['avatar']), // Updated this line
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
      'monthlyMeetingFrequency': monthlyMeetingFrequency,
      'balance': balance,
      'loanConditions': loanConditions,
      'transactions': transactions,
      'membersId': membersId,
      'headquaterLocation': headquaterLocation,
      'avatar': avatar?.toJson(), // Updated this line
    };
  }
}
