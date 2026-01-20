// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeEntryAdapter extends TypeAdapter<TimeEntry> {
  @override
  final int typeId = 0;

  @override
  TimeEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeEntry(
      id: fields[0] as String?,
      date: fields[1] as DateTime,
      time: fields[2] as String,
      text: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
