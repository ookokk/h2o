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
  int? wakeUpHour;

  @HiveField(4)
  int? wakeUpMinute;

  @HiveField(5)
  int? bedHour;

  @HiveField(6)
  int? bedMinute;

  @HiveField(7)
  double? dailyWaterNeed;

  @HiveField(8)
  String? trainingHardness;

  @HiveField(9)
  int? age;

  @HiveField(10)
  bool? isRegistered = false;

  UserModel(
      {this.id,
      this.gender,
      this.weight,
      this.wakeUpHour,
      this.wakeUpMinute,
      this.bedHour,
      this.bedMinute,
      this.dailyWaterNeed,
      this.trainingHardness,
      this.age});
}
