import 'package:cloud_firestore/cloud_firestore.dart';

class WaterIntakeRecord {
  int recordId;
  DateTime dateTime;
  double amount;

  WaterIntakeRecord(
      {required this.recordId, required this.dateTime, required this.amount});

  factory WaterIntakeRecord.fromJson(Map<String, dynamic> json) {
    final recordId = json['recordId'];
    final timestamp = json['dateTime'];

    if (recordId is int && timestamp is Timestamp) {
      return WaterIntakeRecord(
        recordId: recordId,
        dateTime: timestamp.toDate(),
        amount: json['amount'],
      );
    } else {
      return WaterIntakeRecord(
        recordId: 0,
        dateTime: DateTime.now(),
        amount: 300,
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'dateTime': dateTime.toIso8601String(),
      'amount': amount,
    };
  }
}
