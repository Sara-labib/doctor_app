import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

// Specializations
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
          List<SpecializationData?>? specializationDataList) =
      SpecializationsSuccess;
  const factory HomeState.specializationsError({required String error}) = SpecializationsError;


//Doctors
const factory HomeState.doctorsSuccess (List <Doctors?>? doctorsList) = DoctorsSuccess; 
const factory HomeState.doctorsError(ErrorHandler errorHandler) = DooctorsError;



}
