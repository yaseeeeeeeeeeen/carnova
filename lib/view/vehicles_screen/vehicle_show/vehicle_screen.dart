import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/account_underverification.dart';
import 'package:second_project/view/vehicles_screen/vehicle_add/vehicle_add1.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/my_vehicles.dart';
import 'package:second_project/view/vehicles_screen/vehicle_show/pending_vehicles.dart';

class MyVehicles extends StatelessWidget {
  const MyVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                tooltip: 'Vehicle Add',
                onPressed: () {
                  if (hostModelData!.isVerified) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddVehicle()));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AccountUnderverificationScreen()));
                  }
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
            const SizedBox(width: 10),
          ],
          centerTitle: true,
          backgroundColor: appbarColorH,
          title: Text('MY VEHICLES', style: GoogleFonts.poppins()),
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: ContainedTabBarView(
            tabBarViewProperties: const TabBarViewProperties(
                physics: AlwaysScrollableScrollPhysics()),
            tabBarProperties: TabBarProperties(
                indicatorWeight: 4,
                indicatorColor: appbarColorH,
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelColor: Colors.black),
            tabs: const [
              Text('My Vehicles'),
              Text('Processing'),
            ],
            views:  [MyvehiclesList(), PendigVerification()],
            onChange: (index) {},
          ),
        ));
  }
}




