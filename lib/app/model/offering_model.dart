import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:hive/hive.dart';

part 'offering_model.freezed.dart';
part 'offering_model.g.dart';

@freezed
class OfferingModel with _$OfferingModel {
  @HiveType(typeId: 1, adapterName: 'OfferingModelAdapter')
  const factory OfferingModel({
    @HiveField(0) @JsonKey(name: "practitionerName") String? practitionerName,
    @HiveField(1) @JsonKey(name: "title") String? title,
    @HiveField(2) @JsonKey(name: "price") int? price,
    @HiveField(3) @JsonKey(name: "description") String? description,
    @HiveField(4) @JsonKey(name: "category") String? category,
    @HiveField(5) @JsonKey(name: "duration") String? duration,
    @HiveField(6) @JsonKey(name: "type") String? type,
  }) = _OfferingModel;

  factory OfferingModel.fromJson(Map<String, dynamic> json) =>
      _$OfferingModelFromJson(json);
}
