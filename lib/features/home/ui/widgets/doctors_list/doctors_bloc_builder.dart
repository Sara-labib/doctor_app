import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/home_state.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DooctorsError,
      builder: (context, state) {
        return state.maybeWhen(doctorsSuccess: (doctorsList) {
          return setupSuccess(doctorsList);
        }, doctorsError: (errorHandler) {
          return setupError();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }

  Widget setupSuccess(doctorsList) {
    return const DoctorsListView(

    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
