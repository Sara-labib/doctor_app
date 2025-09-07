import 'package:doctor_app/features/home/models/specialization_response_model.dart';
import 'package:doctor_app/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter/widgets.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctorsList?.length,
      itemBuilder: (context, index) {
        return DoctorsListViewItem(
          doctorsModel: doctorsList?[index],
        );
      },
    );
  }
}
