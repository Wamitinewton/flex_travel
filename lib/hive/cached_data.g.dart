// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedDataAdapter extends TypeAdapter<CachedData> {
  @override
  final int typeId = 0;

  @override
  CachedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedData()..data = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, CachedData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  } 

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
