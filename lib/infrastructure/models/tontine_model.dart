import 'member_model.dart';
import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/infrastructure/models/cycle_model.dart';



class TontineModel extends TontineEntity {
  TontineModel({
    required String id,
    required String name,
    required double contributionAmount,
    String? contributionFrequency,
    String? receiverFrequency,
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
      contributionFrequency: json['contributionFrequency'],
      receiverFrequency: json['receiverFrequency'],
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
      'contributionFrequency': contributionFrequency,
      'receiverFrequency': receiverFrequency,
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
}
