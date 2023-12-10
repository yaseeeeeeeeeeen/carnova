import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/car_container.dart';
import 'package:second_project/utils/snackbar.dart';

class MyvehiclesList extends StatelessWidget {
  MyvehiclesList({super.key});
  List<VehicleFetchModal> verifiedList = [];
  @override
  Widget build(BuildContext context) {
       return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
        listener: (context, state) {
          if (state is VehileDataSuccsess) {
            verifiedList = state.verifiedVehicles;
          } else if (state is VehileDataFailled) {
            ScaffoldMessenger.of(context)
                .showSnackBar(customSnackbar(context, false, "SOMETHIG WRONG"));
          } else {
            print("something Wrong");
          }
        },
        builder: (context, state) {
          return verifiedList.isEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    final data = verifiedList[index];
                    return TrendigContainer(data: data);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: verifiedList.length)
              : const Center(child: Text("data is Empty"));
        },
      ),
    );
  }
}
