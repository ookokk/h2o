import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(
  typeId: 1,
  adapterName: 'UserModelAdapter',
)
class UserModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? gender;

  @HiveField(2)
  double? weight;

  @HiveField(3)
  TimeOfDay? wakeUpTime;

  @HiveField(4)
  TimeOfDay? bedTime;

  @HiveField(5)
  double? dailyWaterNeed;

  @HiveField(6)
  String? trainingHardness;

  @HiveField(7)
  int? age;

  UserModel(
      {this.id,
      this.gender,
      this.weight,
      this.wakeUpTime,
      this.bedTime,
      this.dailyWaterNeed,
      this.trainingHardness,
      this.age});
}
