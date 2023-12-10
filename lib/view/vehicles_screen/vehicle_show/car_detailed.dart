import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_project/utils/appbar.dart';

class CarDetailedScreen extends StatelessWidget {
  const CarDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    // double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: customAppBarH("PORSCHE 911"),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(children: [
          Container(
              height: h / 4, width: double.maxFinite, color: Colors.black12),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(5),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)]);
            },
          ),
          
        ]),
      ),
    );
  }
}
