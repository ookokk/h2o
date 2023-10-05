class WaterIntakeModel {
  int recordId;
  DateTime dateTime;
  double amount;

  WaterIntakeModel(
      {required this.recordId, required this.dateTime, required this.amount});

  factory WaterIntakeModel.fromJson(Map<String, dynamic> json) {
    final recordId = json['recordId'];
    final timestamp = json['dateTime'];

    if (recordId is int && timestamp is String) {
      print('else if');
      final parsedDateTime = DateTime.tryParse(timestamp);

      if (parsedDateTime != null) {
        print('ikinci if if');
        return WaterIntakeModel(
          recordId: recordId,
          dateTime: parsedDateTime,
          amount: json['amount'],
        );
      }
    }
    print('kosulsuz if');
    return WaterIntakeModel(
      recordId: 0,
      dateTime: DateTime.now(),
      amount: 300,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recordId': recordId,
      'dateTime': dateTime.toIso8601String(),
      'amount': amount,
    };
  }
}
