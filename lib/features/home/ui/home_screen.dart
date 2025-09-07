import 'package:doctor_app/core/extensions/spacing_extension.dart';
import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:doctor_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:doctor_app/features/home/ui/widgets/specializations_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch specializations when the screen initializes
    context.read<HomeCubit>().getSpecialization();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              24.heightBox,
              const DoctorsSpecialitySeeAll(),
              18.heightBox,
              const DoctorsListViewItem(),
              const DoctorsSpecialityListView(specializationDataList: []),
              18.heightBox,
              const SpecializationsAndDoctorsBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
