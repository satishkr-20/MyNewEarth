part of 'offering_bloc.dart';

@freezed
class OfferingState with _$OfferingState {
  const factory OfferingState({
    @Default(OfferingStatus.initial) OfferingStatus status,
    @Default('') String error,
    OfferingModel? offeringModel,
    @Default([]) List<OfferingModel> offeringList,
  }) = _OfferingState;
}

enum OfferingStatus {
  initial,
  loading,
  updating,
  updateSuccess,
  updateError,
  error,
  toastError,
  success,
  completed,
}
