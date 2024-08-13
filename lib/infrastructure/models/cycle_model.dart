import 'member_model.dart';
import 'penalty_model.dart';
import 'package:manzon/domain/entities/cycle_entity.dart';
import 'package:manzon/infrastructure/models/tontine_contribution_model.dart';

class CycleModel extends CycleEntity {
  // final List<PenaltyModel>? penalties;

  CycleModel({
    required String id,
    required int number,
    required int sequenceNumber,
    required String tontineId,
    required MemberModel receiver,
    required DateTime startDate,
    required DateTime endDate,
    required bool isCompleted,
    required List<TontineContributionModel> contributions,
     List<PenaltyModel>? penalties,
  }) : super(
          id: id,
          number: number,
          sequenceNumber: sequenceNumber,
          tontineId: tontineId,
          receiver: receiver,
          startDate: startDate,
          endDate: endDate,
          isCompleted: isCompleted,
          contributions: contributions,
          penalties: penalties,
        );

  factory CycleModel.fromJson(Map<String, dynamic> json) {
    return CycleModel(
      id: json['id'],
      number: json['number'],
      sequenceNumber: json['sequenceNumber'],
      tontineId: json['tontineId'],
      receiver: MemberModel.fromJson(json['receiver']),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      isCompleted: json['isCompleted'],
      contributions: (json['contributions'] as List<dynamic>)
          .map((e) => TontineContributionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      penalties: (json['penalties'] as List<dynamic>)?.map((e) => PenaltyModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'sequenceNumber': sequenceNumber,
      'tontineId': tontineId,
      'receiver': (receiver as MemberModel).toJson(),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'isCompleted': isCompleted,
      'contributions': contributions.map((e) => (e as TontineContributionModel).toJson()).toList(),
      // 'penalties': penalties?.map((e) =>  e.toJson()).toList(),
    };
  }
}
