import 'package:flutter/material.dart';
import 'package:second_project/host_side/resources/constants/colors.dart';
import 'package:second_project/host_side/view/home_screen.dart';
import 'package:second_project/host_side/view/profile_screen.dart';
import 'package:second_project/host_side/view/vehicles_screen/vehicle_screen.dart';

class CoustomNavBar extends StatefulWidget {
  const CoustomNavBar({super.key});

  @override
  State<CoustomNavBar> createState() => _MainScreeeenState();
}

class _MainScreeeenState extends State<CoustomNavBar> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final carNavKey = GlobalKey<NavigatorState>();
  final headNavKey = GlobalKey<NavigatorState>();
  int selectTab = 0;
  List<NavModal> items = [];
  @override
  void initState() {
    items = [
      NavModal(page: const HomeScreen(), navKey: homeNavKey),
      NavModal(page: const MyVehicles(), navKey: carNavKey),
      NavModal(page: const ProfileScreen(), navKey: headNavKey),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (items[selectTab].navKey.currentState?.canPop() ?? false) {
            {
              items[selectTab].navKey.currentState?.pop();
              return Future.value(false);
            }
          } else {
            return Future.value(true);
          }
        },
        child: Stack(
          children: [
            Scaffold(
              // extendBody: true,
              body: IndexedStack(
                index: selectTab,
                children: items
                    .map((page) => Navigator(
                          key: page.navKey,
                          onGenerateInitialRoutes: (navigator, initialRoute) {
                            return [
                              MaterialPageRoute(builder: (context) => page.page)
                            ];
                          },
                        ))
                    .toList(),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: NavBar(
                pageIndex: selectTab,
                ontap: (index) {
                  if (index == selectTab) {
                    items[index]
                        .navKey
                        .currentState
                        ?.popUntil((route) => route.isFirst);
                  } else {
                    setState(() {
                      selectTab = index;
                    });
                  }
                },
              ),
            )
          ],
        ));
  }
}

class NavModal {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;
  NavModal({required this.page, required this.navKey});
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
