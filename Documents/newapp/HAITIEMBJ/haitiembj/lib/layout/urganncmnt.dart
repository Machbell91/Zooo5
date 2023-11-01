import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class Carousel extends StatefulWidget {
  const Carousel({Key? key});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imgList = [
    '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/announcement/Annoncepublic.jpeg',
    '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/announcement/annonce2.jpeg'
  ];

  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _current = (_current + 1) % imgList.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Annuler le minuteur.
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned.fill(
      child: SizedBox(
        width: screenWidth * 0.4, // 20% plus grande que la largeur de l'écran
        height: screenHeight * 1.2, // Proportionnel à la hauteur de l'écran
        child: CarouselSlider(
          options: CarouselOptions(
            height: screenHeight * 1.2,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imgList.map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
        ),
      ),
    );
  }
}
