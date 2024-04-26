// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_save_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvatarAdapter extends TypeAdapter<AvatarSave> {
  @override
  final int typeId = 1;

  @override
  AvatarSave read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvatarSave(
      userName: fields[0] as String,
      userPrompt: fields[1] as String,
      userPromptImage: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AvatarSave obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.userPrompt)
      ..writeByte(2)
      ..write(obj.userPromptImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvatarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
