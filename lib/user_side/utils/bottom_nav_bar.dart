// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/view/history_screen.dart';
import 'package:second_project/user_side/view/home_screen.dart';
import 'package:second_project/user_side/view/second_screen.dart';
import 'package:second_project/user_side/view/user_profile.dart';

// ignore: must_be_immutable
class ScreenParantU extends StatefulWidget {
  ScreenParantU({super.key, this.index});
  int? index;
  @override
  State<ScreenParantU> createState() => _ScreenParantState();
}

class _ScreenParantState extends State<ScreenParantU> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const FindVehicleU(),
    const HistoryScreen(),
    const UserProfile()
  ];
  @override
  void initState() {
    if (widget.index != null) {
      currentPage = widget.index!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: pages[currentPage],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: NavBarU(
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

class NavBarU extends StatelessWidget {
  final int pageIndex;
  final Function(int) ontap;
  const NavBarU({super.key, required this.pageIndex, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bottomNavColorU,
        ),
        height: 60,
        child: Row(
          children: [
            navItem(Icons.home, pageIndex == 0, ontap: () => ontap(0)),
            navItem(Icons.search, pageIndex == 1, ontap: () => ontap(1)),
            navItem(Icons.history, pageIndex == 2, ontap: () => ontap(2)),
            navItem(Icons.person, pageIndex == 3, ontap: () => ontap(3)),
          ],
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? ontap}) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Icon(icon,
          color: selected ? mainColorU : mainColorU.withOpacity(0.4)),
    ));
  }
}
