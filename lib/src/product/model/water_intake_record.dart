class WaterIntakeRecord {
  DateTime dateTime;
  double amount;

  WaterIntakeRecord({required this.dateTime, required this.amount});

  factory WaterIntakeRecord.fromJson(Map<String, dynamic> json) {
    return WaterIntakeRecord(
      dateTime: DateTime.parse(json['dateTime']),
      amount: json['amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime.toIso8601String(),
      'amount': amount,
    };
  }
}
