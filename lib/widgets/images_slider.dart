import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map(
            (e) => Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                shape: BoxShape.rectangle,
              ),
              child:  PhotoWidget(photoLink: e, canOpen: true),
            ),
          )
          .toList(),
      options: CarouselOptions(
          height: 180,
          enlargeCenterPage: true,
          viewportFraction: 1,
          initialPage: 0,
          reverse: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          onPageChanged: (i, _) {}),
    );
  }
}
