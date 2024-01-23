import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/utils/appbar.dart';

class CarMoreImages extends StatelessWidget {
  const CarMoreImages({super.key, required this.images});
  final List images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height / 5, autoPlay: true),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImagePreviewWid(imagePath: i)));
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage("${HostUrl.imagegettingUrl}$i"),
                          fit: BoxFit.cover))),
            );
          },
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class ImagePreviewWid extends StatelessWidget {
  ImagePreviewWid({super.key, required this.imagePath});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorH,
      appBar: customAppBarH("IMAGE PREVIEW"),
      body: Center(
        child: Image(image: NetworkImage("${HostUrl.imagegettingUrl}$imagePath")),
      ),
    );
  }
}
