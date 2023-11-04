import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/announcement/Annoncepublic.jpeg',
      'assets/announcement/annonce2.jpeg'
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 1200.0, // Hauteur du carrousel
        viewportFraction: 1.0,
        autoPlay: true,
        aspectRatio: 2.0, // Ratio de l'image
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
      ),
      items: imgList.map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
    );
  }
}

