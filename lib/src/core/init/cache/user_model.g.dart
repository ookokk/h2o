// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      gender: fields[1] as String?,
      weight: fields[2] as double?,
      wakeUpHour: fields[3] as int?,
      wakeUpMinute: fields[4] as int?,
      bedHour: fields[5] as int?,
      bedMinute: fields[6] as int?,
      dailyWaterNeed: fields[7] as double?,
      trainingHardness: fields[8] as String?,
      isRegistered: fields[10] as bool?,
      updatingWaterNeed: fields[11] as double?,
      isDarkTheme: fields[12] as bool?,
      age: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.wakeUpHour)
      ..writeByte(4)
      ..write(obj.wakeUpMinute)
      ..writeByte(5)
      ..write(obj.bedHour)
      ..writeByte(6)
      ..write(obj.bedMinute)
      ..writeByte(7)
      ..write(obj.dailyWaterNeed)
      ..writeByte(8)
      ..write(obj.trainingHardness)
      ..writeByte(9)
      ..write(obj.age)
      ..writeByte(10)
      ..write(obj.isRegistered)
      ..writeByte(11)
      ..write(obj.updatingWaterNeed)
      ..writeByte(12)
      ..write(obj.isDarkTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
