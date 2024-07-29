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
    List<MemberEntity>? members, // Already present
    List<String>? adminIds, // Updated field for admin IDs as List<String>
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
          members: members ?? [], // Handle potential null value
          adminIds: adminIds ?? [], // Initialize to empty list if null
          headquaterLocation: headquaterLocation,
          avatar: avatar,
        );

  factory AssociationModel.fromJson(Map<String, dynamic> json) {
    return AssociationModel(
      uniqueId: json['uniqueId'],
      name: json['name'],
      headquaterCity: json['headquaterCity'],
      tontines: (json['tontines'] != null) ? List<String>.from(json['tontines']) : [],
      meetingDays: (json['meetingDays'] != null) ? List<String>.from(json['meetingDays']) : [],
      paymentFrequency: json['paymentFrequency'],
      monthlyMeetingFrequency: json['monthlyMeetingFrequency'],
      balance: (json['balance'] != null) ? (json['balance'] as num).toDouble() : null,
      loanConditions: json['loanConditions'],
      transactions: (json['transactions'] != null) ? List<String>.from(json['transactions']) : [],
      members: (json['members'] != null)
          ? (json['members'] as List).map((member) => MemberEntity.fromJson(member)).toList()
          : [],
      adminIds: (json['adminIds'] != null) ? List<String>.from(json['adminIds']) : [], // Updated field for admin IDs
      headquaterLocation: json['headquaterLocation'],
      avatar: json['avatar'] != null ? MediaEntity.fromJson(json['avatar']) : null,
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
      'members': members.map((member) => member.toJson()).toList(), // Already present
      'adminIds': adminIds, // Updated to List<String>
      'headquaterLocation': headquaterLocation,
      'avatar': avatar?.toJson(),
    };
  }
}
