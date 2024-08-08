import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manzon/infrastructure/models/cycle_model.dart';
import 'package:manzon/infrastructure/mappers/member_mapper.dart';
import 'package:manzon/app/core/utils/constants/app_api_key.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';

class TontineDataSource {
  late final CollectionReference<TontineModel> tontineRef;
  late final Function(String) cycleRef;
  late final Function(String, String) contributionRef;

  TontineDataSource() {
    tontineRef = FirebaseFirestore.instance.collection(ApiKey.TONTINE_KEY).withConverter<TontineModel>(
      fromFirestore: (snapshots, _) => TontineModel.fromJson(snapshots.data()!),
      toFirestore: (tontine, _) => tontine.toJson(),
    );

    cycleRef = _createCycleRef;
    contributionRef = _createContributionRef;
  }

  CollectionReference<CycleModel> _createCycleRef(String tontineId) {
    return tontineRef.doc(tontineId).collection('cycles').withConverter<CycleModel>(
      fromFirestore: (snapshots, _) => CycleModel.fromJson(snapshots.data()!),
      toFirestore: (cycle, _) => cycle.toJson(),
    );
  }

  CollectionReference<TontineContributionModel> _createContributionRef(String tontineId, String cycleId) {
    return cycleRef(tontineId).doc(cycleId).collection('contributions').withConverter<TontineContributionModel>(
      fromFirestore: (snapshots, _) => TontineContributionModel.fromJson(snapshots.data()!),
      toFirestore: (contribution, _) => contribution.toJson(),
    );
  }

  Future<void> addTontine(TontineModel tontineModel) async {
    await tontineRef.doc(tontineModel.id).set(tontineModel);
    await _generateCycles(tontineModel);
  }

  Future<TontineModel?> getTontineById(String id) async {
    final doc = await tontineRef.doc(id).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  Future<void> updateTontine(TontineModel tontineModel) async {
    await tontineRef.doc(tontineModel.id).set(tontineModel);
  }

  Future<void> deleteTontine(String id) async {
    await tontineRef.doc(id).delete();
  }

  Future<void> addCycle(String tontineId, CycleModel cycleModel) async {
    await cycleRef(tontineId).doc(cycleModel.id).set(cycleModel);
  }

  Future<CycleModel?> getCycleById(String tontineId, String cycleId) async {
    final doc = await cycleRef(tontineId).doc(cycleId).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  Future<void> updateCycle(String tontineId, CycleModel cycleModel) async {
    await cycleRef(tontineId).doc(cycleModel.id).set(cycleModel);
  }

  Future<void> deleteCycle(String tontineId, String cycleId) async {
    await cycleRef(tontineId).doc(cycleId).delete();
  }

  Future<void> addContribution(String tontineId, String cycleId, TontineContributionModel contributionModel) async {
    await contributionRef(tontineId, cycleId).doc(contributionModel.id).set(contributionModel);
  }

  Future<TontineContributionModel?> getContributionById(String tontineId, String cycleId, String contributionId) async {
    final doc = await contributionRef(tontineId, cycleId).doc(contributionId).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  }

  Future<void> updateContribution(String tontineId, String cycleId, TontineContributionModel contributionModel) async {
    await contributionRef(tontineId, cycleId).doc(contributionModel.id).set(contributionModel);
  }

  Future<void> deleteContribution(String tontineId, String cycleId, String contributionId) async {
    await contributionRef(tontineId, cycleId).doc(contributionId).delete();
  }

Future<void> _generateCycles(TontineModel tontineModel) async {
  final List<CycleModel> cycles = [];
  final int totalCycles = (tontineModel.members?.length ?? 0) * tontineModel.cycleDuration;
  final DateTime now = DateTime.now();
  DateTime startDate = now;

  for (int i = 0; i < totalCycles; i++) {
    final int currentMemberIndex = i ~/ tontineModel.cycleDuration;
    final MemberEntity receiver = tontineModel.orderList![currentMemberIndex % tontineModel.orderList!.length];
    final DateTime endDate = startDate.add(_getDuration(ContributionFrequency.values.firstWhere((e) => e.toString() == tontineModel.contributionFrequency)));

    final cycle = CycleModel(
      id: Uuid().v4(),
      number: currentMemberIndex + 1,
      sequenceNumber: i + 1,
      tontineId: tontineModel.id,
      receiver: MemberMapper.toModel(receiver),
      startDate: startDate,
      endDate: endDate,
      isCompleted: false,
      contributions: [],
    );

    cycles.add(cycle);
    startDate = endDate;
  }

  for (final cycle in cycles) {
    await addCycle(tontineModel.id, cycle);
  }

  await updateTontine(tontineModel.copyWith(cycles: cycles));
}


  Duration _getDuration(ContributionFrequency frequency) {
    switch (frequency) {
      case ContributionFrequency.weekly:
        return Duration(days: 7); // Fixed weekly duration
      case ContributionFrequency.biWeekly:
        return Duration(days: 14); // Fixed bi-weekly duration
      case ContributionFrequency.monthly:
        return Duration(days: 30); // Approximate monthly duration
      default:
        throw Exception('Invalid frequency');
    }
  }
}
