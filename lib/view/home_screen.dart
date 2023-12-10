import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resources/components/preview_revenue.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          elevation: 0,
          title: Text('HOME', style: GoogleFonts.poppins()),
          centerTitle: true,
          backgroundColor: appbarColorH),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GridviewContainerWidget(
                    value: '24,538',
                    title: 'Revenue Generated',
                  ),
                  GridviewContainerWidget(
                    value: '30',
                    title: 'Booking',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GridviewContainerWidget(
                    value: '29',
                    title: 'Completed',
                  ),
                  GridviewContainerWidget(
                    value: '11',
                    title: 'Cancelled',
                  ),
                ],
              ),
              const HindTextWidget(
                  isBold: true,
                  text: 'Trending',
                  size: 20,
                  color: Colors.black,
                  left: 0,
                  top: 10),
              // ListView.separated(
              //   physics: const NeverScrollableScrollPhysics(),
              //   separatorBuilder: (context, index) => const Divider(),
              //   itemCount: 2,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return  TrendigContainer();
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
