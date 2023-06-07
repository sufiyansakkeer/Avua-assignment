// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_form_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationFormModelAdapter extends TypeAdapter<RegistrationFormModel> {
  @override
  final int typeId = 1;

  @override
  RegistrationFormModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistrationFormModel(
      id: fields[0] as String,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      date: fields[3] as String,
      email: fields[4] as String,
      phoneNumber: fields[5] as int,
      resume: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegistrationFormModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.resume);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationFormModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
