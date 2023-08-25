// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabiterAdapter extends TypeAdapter<Habiter> {
  @override
  final int typeId = 1;

  @override
  Habiter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habiter(
      habitName: fields[0] as String,
      habitDetails: fields[1] as String,
      habitPeriod: fields[3] as String,
      habitActivity: fields[2] as String,
      dateTaken: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Habiter obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.habitName)
      ..writeByte(1)
      ..write(obj.habitDetails)
      ..writeByte(2)
      ..write(obj.habitActivity)
      ..writeByte(3)
      ..write(obj.habitPeriod)
      ..writeByte(4)
      ..write(obj.dateTaken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabiterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
