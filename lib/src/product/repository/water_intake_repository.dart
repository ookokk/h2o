import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2o_flutter/src/core/init/cache/hive_manager.dart';
import 'package:h2o_flutter/src/core/init/cache/locator.dart';
import 'package:h2o_flutter/src/product/model/water_intake_record.dart';
import 'dart:math';

class WaterIntakeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Random _random = Random();

  Future<void> addWaterIntakeRecord(
      String userId, WaterIntakeRecord record) async {
    try {
      final dataBox = getIt.get<IHiveManager>();
      final userId = dataBox.user.get('userId');

      final int randomRecordId = _random.nextInt(999999);
      record.recordId = randomRecordId;

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('history')
          .add(record.toJson());
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  Future<void> deleteWaterIntakeRecord(String userId, String recordId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('history')
          .doc(recordId)
          .delete();
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  Stream<List<WaterIntakeRecord>> getWaterIntakeRecords(String userId) {
    try {
      return _firestore
          .collection('users')
          .doc(userId)
          .collection('history')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((doc) => WaterIntakeRecord.fromJson(doc.data()))
              .toList());
    } catch (e) {
      print("Hata oluştu: $e");
      rethrow;
    }
  }
}
