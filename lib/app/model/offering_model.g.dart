// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offering_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferingModelAdapter extends TypeAdapter<_$OfferingModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$OfferingModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$OfferingModelImpl(
      practitionerName: fields[0] as String?,
      title: fields[1] as String?,
      price: fields[2] as int?,
      description: fields[3] as String?,
      category: fields[4] as String?,
      duration: fields[5] as String?,
      type: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$OfferingModelImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.practitionerName)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferingModelImpl _$$OfferingModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferingModelImpl(
      practitionerName: json['practitionerName'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      duration: json['duration'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$OfferingModelImplToJson(_$OfferingModelImpl instance) =>
    <String, dynamic>{
      'practitionerName': instance.practitionerName,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'duration': instance.duration,
      'type': instance.type,
    };
