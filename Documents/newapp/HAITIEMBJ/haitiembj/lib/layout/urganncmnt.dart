import 'dart:async';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  final List<String> imgList = [
    '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/announcement/Annoncepublic.jpeg',
    '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/announcement/annonce2.jpeg'
  ];

  int _current = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _current = (_current + 1) % imgList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = screenWidth * 0.09;

    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.only(left: 237),
        child: SizedBox(
          width: targetWidth,
          height: 265,
          child: Column(
            children: [
              Expanded(
                child: PhotoView(
                  imageProvider: AssetImage(imgList[_current]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                ),
              ),
              DotsIndicator(
                dotsCount: imgList.length,
                position: _current.toDouble(),
              )
            ],
          ),
        ),
      ),
    );
  }

}