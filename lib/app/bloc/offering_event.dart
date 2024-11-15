part of 'offering_bloc.dart';

@freezed
class OfferingEvent with _$OfferingEvent {
  const factory OfferingEvent.addOffering({OfferingModel? offeringModelAdd}) =
      _AddOffering;
  const factory OfferingEvent.updateOffering(
      {OfferingModel? offeringModelUpdate, int? indexUpdate}) = _UpdateOffering;
  const factory OfferingEvent.removeOffering({int? index}) = _RemoveOffering;
  const factory OfferingEvent.getOffering() = _GetOffering;
}
