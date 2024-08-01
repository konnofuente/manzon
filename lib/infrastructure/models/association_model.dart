import '../../domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/member_model.dart';
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
    List<MemberModel>? members,
    List<String>? membersId,
    String? headquaterLocation,
    MediaEntity? avatar,
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
          members: members ?? [],
          membersId: membersId ?? [],
          headquaterLocation: headquaterLocation,
          avatar: avatar,
        );

  factory AssociationModel.fromJson(Map<String, dynamic> json) {
    return AssociationModel(
      uniqueId: json['uniqueId'] ?? '',
      name: json['name'] ?? '',

      tontines: (json['tontines'] != null && json['tontines'] is List)
          ? List<String>.from(json['tontines'])
          : [],
      meetingDays: (json['meetingDays'] != null && json['meetingDays'] is List)
          ? List<String>.from(json['meetingDays'])
          : [],
      paymentFrequency: json['paymentFrequency'] ??
          '', 
      monthlyMeetingFrequency:
          json['monthlyMeetingFrequency'] ?? 0, 
      balance: (json['balance'] != null)
          ? (json['balance'] as num).toDouble()
          : 0.0,
      loanConditions: json['loanConditions'] ?? '',
      transactions:
          (json['transactions'] != null && json['transactions'] is List)
              ? List<String>.from(json['transactions'])
              : [],
      members: (json['members'] != null && json['members'] is List)
          ? (json['members'] as List)
              .map((member) => MemberModel.fromJson(member))
              .toList()
          : [],
      membersId: (json['membersId'] != null && json['membersId'] is List)
          ? List<String>.from(json['membersId'])
          : [],
      headquaterLocation: json['headquaterLocation'] ?? '',
      avatar:
          json['avatar'] != null ? MediaEntity.fromJson(json['avatar']) : null,
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
      'members': members.map((member) => member.toJson()).toList(),
      'membersId': membersId,
      'headquaterLocation': headquaterLocation,
      'avatar': avatar?.toJson(),
    };
  }
}
