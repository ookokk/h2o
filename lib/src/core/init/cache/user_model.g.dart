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
      wakeUpTime: fields[3] as TimeOfDay?,
      bedTime: fields[4] as TimeOfDay?,
      dailyWaterNeed: fields[5] as double?,
      trainingHardness: fields[6] as String?,
      age: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.wakeUpTime)
      ..writeByte(4)
      ..write(obj.bedTime)
      ..writeByte(5)
      ..write(obj.dailyWaterNeed)
      ..writeByte(6)
      ..write(obj.trainingHardness)
      ..writeByte(7)
      ..write(obj.age);
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
