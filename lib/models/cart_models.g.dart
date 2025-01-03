// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelsAdapter extends TypeAdapter<CartModels> {
  @override
  final int typeId = 1;

  @override
  CartModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModels(
      id: fields[0] as String,
      title: fields[1] as String,
      price: fields[2] as String,
      quantity: fields[3] as String,
      unit: fields[5] as String,
      image: fields[4] as String,
      discount: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CartModels obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.unit)
      ..writeByte(6)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
