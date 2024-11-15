import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../model/offering_model.dart';
part 'offering_event.dart';
part 'offering_state.dart';
part 'offering_bloc.freezed.dart';

class OfferingBloc extends Bloc<OfferingEvent, OfferingState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final Box<OfferingModel> offeringsBox =
      Hive.box<OfferingModel>('offeringsBox');

  OfferingBloc() : super(const OfferingState(offeringModel: OfferingModel())) {
    on<_AddOffering>((event, emit) async {
      emit(
          state.copyWith(status: OfferingStatus.loading)); // Emit loading state
      try {
        // Validate offering data
        if (event.offeringModelAdd == null) {
          emit(state.copyWith(
            status: OfferingStatus.error,
            error: 'Offering data is missing!',
          ));
          return;
        }

        // Save offering to Hive (using `offeringsBox` Hive instance)
        await offeringsBox.add(event.offeringModelAdd!);

        // Fetch the updated list of offerings to ensure UI sync
        final updatedOfferings =
            offeringsBox.values.toList().cast<OfferingModel>();

        // Update state with the new list
        emit(state.copyWith(
          status: OfferingStatus.success,
          offeringList: updatedOfferings,
        ));
      } catch (e) {
        // Handle any errors during the add operation
        emit(state.copyWith(
          status: OfferingStatus.error,
          error: 'Failed to add offering: ${e.toString()}',
        ));
      }
    });

    on<_UpdateOffering>((event, emit) async {
      emit(state.copyWith(status: OfferingStatus.loading));

      try {
        if (event.offeringModelUpdate == null) {
          emit(state.copyWith(
              status: OfferingStatus.error,
              error: 'Updated offering data is missing!'));
          return;
        }

        if (event.indexUpdate == null || event.indexUpdate! < 0) {
          print('event.indexUpdate: ${event.indexUpdate}');

          emit(state.copyWith(
              status: OfferingStatus.error,
              error: 'Invalid index for updating offering!'));
          return;
        }

        final offeringsBox = Hive.box<OfferingModel>('offeringsBox');
        print('Updating at index: ${event.indexUpdate}');
        print('New offering data: ${event.offeringModelUpdate}');

        await offeringsBox.putAt(
            event.indexUpdate!, event.offeringModelUpdate!);

        final updatedList = offeringsBox.values.toList().cast<OfferingModel>();
        print('Updated List: $updatedList');

        emit(state.copyWith(
          status: OfferingStatus.success,
          offeringList: updatedList,
        ));
      } catch (e, stackTrace) {
        print('Update Error: $e\nStackTrace: $stackTrace');
        emit(state.copyWith(
          status: OfferingStatus.error,
          error: 'Failed to update offering: $e',
        ));
      }
    });

    on<_GetOffering>((event, emit) async {
      emit(state.copyWith(status: OfferingStatus.loading));
      try {
        // Fetch all offerings from Hive
        final offerings = offeringsBox.values.toList();
        emit(state.copyWith(
          status: OfferingStatus.success,
          offeringList: offerings,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: OfferingStatus.error,
          error: e.toString(),
        ));
      }
    });

    on<_RemoveOffering>((event, emit) async {
      emit(state.copyWith(status: OfferingStatus.loading));
      try {
        if (event.index == null || event.index! < 0) {
          emit(state.copyWith(
              status: OfferingStatus.error,
              error: 'Invalid index for removal!'));
          return;
        }

        // Remove offering from Hive
        await offeringsBox.deleteAt(event.index!);

        // Trigger reload
        add(const OfferingEvent.getOffering());
        emit(state.copyWith(status: OfferingStatus.success));
      } catch (e) {
        emit(state.copyWith(
          status: OfferingStatus.error,
          error: e.toString(),
        ));
      }
    });
  }
}
