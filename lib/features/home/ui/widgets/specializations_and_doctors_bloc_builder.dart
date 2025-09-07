import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
            specializationsLoading: () {
              return setupLoading();
            },
            specializationsSuccess: (specializationDataList) {
              var specializationsList = specializationDataList;
              return setupSuccess(
                  specializationsList as SpecializationResponseModel);
            },
            specializationsError: (errorHandler) => setupError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupSuccess(SpecializationResponseModel specializationResponseModel) {
    final specializations =
        specializationResponseModel.specializationDataList ?? [];
    return Column(
      children: [
        DoctorsSpecialityListView(
          specializationDataList: specializations,
        ),
        8.heightBox,
        Expanded(
          child: SingleChildScrollView(
            child: DoctorsListView(
              doctorsList: specializations.isNotEmpty
                  ? specializations[0]?.doctorsList
                  : [],
            ),
          ),
        ),
      ],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
