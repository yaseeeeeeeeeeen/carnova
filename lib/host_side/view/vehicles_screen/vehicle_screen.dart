import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/host_side/resources/components/car_container.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/view/vehicles_screen/vehicle_add1.dart';

class MyVehicles extends StatelessWidget {
  const MyVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                tooltip: 'Vehicle Add',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddVehicle()));
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
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [TrendigContainer(), Divider(), TrendigContainer()],
          ),
        ),
      ),
    );
  }
}
