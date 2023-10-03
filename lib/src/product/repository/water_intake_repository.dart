import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2o_flutter/src/product/model/water_intake_record.dart';

class WaterIntakeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addWaterIntakeRecord(WaterIntakeRecord record) async {
    try {
      await _firestore.collection('waterIntakeRecords').add(record.toJson());
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }
}
