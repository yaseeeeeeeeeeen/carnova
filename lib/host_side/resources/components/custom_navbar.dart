// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/view/home_screen.dart';
import 'package:second_project/host_side/view/profile_screen.dart';
import 'package:second_project/host_side/view/vehicles_screen/vehicle_screen.dart';

class ScreenParant extends StatefulWidget {
  const ScreenParant({super.key});

  @override
  State<ScreenParant> createState() => _ScreenParantState();
}

class _ScreenParantState extends State<ScreenParant> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const MyVehicles(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: pages[currentPage],
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: NavBar(
            pageIndex: currentPage,
            ontap: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        )
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) ontap;
  const NavBar({super.key, required this.pageIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bottomNavColor,
        ),
        height: 60,
        child: Row(
          children: [
            navItem(Icons.home, pageIndex == 0, ontap: () => ontap(0)),
            navItem(Icons.directions_car, pageIndex == 1,
                ontap: () => ontap(1)),
            navItem(Icons.person, pageIndex == 2, ontap: () => ontap(2)),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? ontap}) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child:
          Icon(icon, color: selected ? mainColor : mainColor.withOpacity(0.4)),
    ));
  }
}
