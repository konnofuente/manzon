import 'member_model.dart';
import 'package:manzon/infrastructure/models/cycle_model.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';

class TontineModel extends TontineEntity {
  TontineModel({
    required String id,
    required String name,
    required double contributionAmount,
    required ContributionFrequency contributionFrequency,
    required ReceiverFrequency receiverFrequency,
    List<MemberModel>? members,
    List<String>? membersId,
    List<MemberModel>? orderList,
    List<CycleModel>? cycles,
    required String associationId,
    double? balance,
    required int cycleDuration,
    List<String>? transactions,
    required int currentCycle,
  }) : super(
          id: id,
          name: name,
          contributionAmount: contributionAmount,
          contributionFrequency: contributionFrequency,
          receiverFrequency: receiverFrequency,
          members: members,
          membersId: membersId,
          orderList: orderList,
          cycles: cycles,
          associationId: associationId,
          balance: balance,
          cycleDuration: cycleDuration,
          transactions: transactions,
          currentCycle: currentCycle,
        );

  factory TontineModel.fromJson(Map<String, dynamic> json) {
    return TontineModel(
      id: json['id'],
      name: json['name'],
      contributionAmount: json['contributionAmount'],
      contributionFrequency: ContributionFrequency.values[json['contributionFrequency']],
      receiverFrequency: ReceiverFrequency.values[json['receiverFrequency']],
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      membersId: (json['membersId'] as List<dynamic>?)?.map((e) => e as String).toList(),
      orderList: (json['orderList'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cycles: (json['cycles'] as List<dynamic>?)
          ?.map((e) => CycleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      associationId: json['associationId'],
      balance: json['balance'],
      cycleDuration: json['cycleDuration'],
      transactions: (json['transactions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      currentCycle: json['currentCycle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contributionAmount': contributionAmount,
      'contributionFrequency': contributionFrequency.index,
      'receiverFrequency': receiverFrequency.index,
      'members': members?.map((e) => (e as MemberModel).toJson()).toList(),
      'membersId': membersId,
      'orderList': orderList?.map((e) => (e as MemberModel).toJson()).toList(),
      'cycles': cycles?.map((e) => (e as CycleModel).toJson()).toList(),
      'associationId': associationId,
      'balance': balance,
      'cycleDuration': cycleDuration,
      'transactions': transactions,
      'currentCycle': currentCycle,
    };
  }

  TontineModel copyWith({
    String? id,
    String? name,
    double? contributionAmount,
    ContributionFrequency? contributionFrequency,
    ReceiverFrequency? receiverFrequency,
    List<MemberModel>? members,
    List<String>? membersId,
    List<MemberModel>? orderList,
    List<CycleModel>? cycles,
    String? associationId,
    double? balance,
    int? cycleDuration,
    List<String>? transactions,
    int? currentCycle,
  }) {
    return TontineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      contributionAmount: contributionAmount ?? this.contributionAmount,
      contributionFrequency: contributionFrequency ?? this.contributionFrequency,
      receiverFrequency: receiverFrequency ?? this.receiverFrequency,
      members: members ?? this.members?.map((e) => e as MemberModel).toList(),
      membersId: membersId ?? this.membersId,
      orderList: orderList ?? this.orderList?.map((e) => e as MemberModel).toList(),
      cycles: cycles ?? this.cycles?.map((e) => e as CycleModel).toList(),
      associationId: associationId ?? this.associationId,
      balance: balance ?? this.balance,
      cycleDuration: cycleDuration ?? this.cycleDuration,
      transactions: transactions ?? this.transactions,
      currentCycle: currentCycle ?? this.currentCycle,
    );
  }
}
