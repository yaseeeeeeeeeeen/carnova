import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_add/vehicle_add_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/car_container.dart';
import 'package:second_project/utils/snackbar.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add1.dart';

class MyvehiclesList extends StatelessWidget {
  MyvehiclesList({super.key});
  List<VehicleFetchModal> verifiedList = [];
  @override
  Widget build(BuildContext context) {
    context.read<VehicleFetchBloc>().add(VehicleDataFetchEvent());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
        listener: (context, state) {
          if (state is VehileDataSuccsess) {
            verifiedList = state.verifiedVehicles;
          } else if (state is VehileDataFailled) {
            ScaffoldMessenger.of(context).showSnackBar(
                customSnackbar(context, false, "VEHICLE DATA FETCHING FAILED"));
          }
        },
        builder: (context, state) {
          return state is LoadingState
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.black))
              : verifiedList.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        final data = verifiedList[index];
                        return GestureDetector(
                            onLongPress: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AddVehicle(vehilcledata: data)));
                            },
                            child: TrendigContainer(data: data));
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: verifiedList.length)
                  : const Center(child: Text("DATA IS EMPTY"));
        },
      ),
    );
  }
}
