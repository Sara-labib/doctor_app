import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:doctor_app/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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

  /// shimmer loading foe specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          8.heightBox,
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationsList) {
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
