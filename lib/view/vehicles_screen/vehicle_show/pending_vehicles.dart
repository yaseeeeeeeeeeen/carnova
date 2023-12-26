import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second_project/blocs/vehicle_fetch/vehicle_fetch_bloc.dart';
import 'package:second_project/modals/vehicle_fetch_modal.dart';
import 'package:second_project/resources/components/car_container.dart';
import 'package:second_project/utils/snackbar.dart';

class PendigVerification extends StatelessWidget {
  PendigVerification({super.key});
  List<VehicleFetchModal> pendingList = [];
  @override
  Widget build(BuildContext context) {
    // context.read<VehicleFetchBloc>().add(VehicleDataFetchEvent());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<VehicleFetchBloc, VehicleFetchState>(
          listener: (context, state) {
            if (state is VehileDataSuccsess) {
              pendingList = state.pendingVehicles;
            } else if (state is VehileDataFailled) {
              topSnackbar(context, state.message, Colors.red, false);
            } else if (state is VehicleListEmptyState) {
              topSnackbar(context, "Vehicle List Empty", Colors.black, true);
            }
          },
          builder: (context, state) {
            return state is VehileDataLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : pendingList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = pendingList[index];
                          return GestureDetector(
                              onLongPress: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) =>
                                //         AddVehicle(vehilcledata: data)));
                              },
                              child: TrendigContainer(data: data));
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: pendingList.length)
                    : const Center(child: Text("DATA IS EMPTY"));
          },
        ),
      ),
    );
  }
}
