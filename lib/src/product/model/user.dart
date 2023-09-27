import 'package:flutter/material.dart';

class User {
  String? gender;
  double? weight;
  TimeOfDay? wakeUpTime;
  TimeOfDay? bedTime;
  int? id;
  double? dailyWaterNeed;

  User({
    this.gender,
    this.weight,
    this.wakeUpTime,
    this.bedTime,
    this.id,
    this.dailyWaterNeed,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      weight: json['weight']?.toDouble(),
      wakeUpTime: _parseTimeOfDay(json['wakeUpTime']),
      bedTime: _parseTimeOfDay(json['bedTime']),
      id: json['id'],
      dailyWaterNeed: json['dailyWaterNeed']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'weight': weight,
      'wakeUpTime': _timeOfDayToJson(wakeUpTime),
      'bedTime': _timeOfDayToJson(bedTime),
      'id': id,
      'dailyWaterNeed': dailyWaterNeed,
    };
  }

  static TimeOfDay? _parseTimeOfDay(String? timeString) {
    if (timeString == null) return null;
    final parts = timeString.split(':');
    if (parts.length == 2) {
      final hour = int.tryParse(parts[0]);
      final minute = int.tryParse(parts[1]);
      if (hour != null && minute != null) {
        return TimeOfDay(hour: hour, minute: minute);
      }
    }
    return null;
  }

  static String? _timeOfDayToJson(TimeOfDay? time) {
    if (time == null) return null;
    return '${time.hour}:${time.minute}';
  }
}
