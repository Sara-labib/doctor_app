import 'package:doctor_app/core/extensions/navigation_extension.dart';
import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationData?>? specializationList;
  void getSpecialization() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(success: (specializationResponseModel) {
      specializationList =
          specializationResponseModel.specializationDataList ?? [];

      // getting the doctors list for the fitsr specialization by default.
      getDoctorsList(specializationId: specializationList?.first?.id);

      emit(HomeState.specializationsSuccess(specializationList));
    }, failure: (apiErrorModel ) {
      emit(HomeState.specializationsError(
           apiErrorModel, error: ''));
    });
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ApiErrorHandler.handle("No doctors found")));
    }
  }

  ///returns thie list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
