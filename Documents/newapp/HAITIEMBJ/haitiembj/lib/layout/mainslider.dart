import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haitiembj/layout/header.dart';
import 'package:haitiembj/layout/footer.dart';
import 'package:haitiembj/layout/regulararticle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AnimatedSlider extends StatefulWidget {
  @override
  _AnimatedSliderState createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  late PageController _pageController;
  late double _currentPage;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 1,
    );

    _currentPage = _pageController.initialPage.toDouble();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: 1300,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: 7, // Modifié pour prendre en compte jusqu'à l'indice 6
            itemBuilder: (context, index) {
              return _buildPage(index);
            },
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page.toDouble();
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotsIndicator(
              dotsCount: 7, // Modifié pour prendre en compte jusqu'à l'indice 6
              position: _currentPage.toInt(),
              decorator: DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPage(int index) {
    return Row(
      children: [
        Image.asset(index.isEven
            ? "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/articlepictures/franco/1.jpeg"
            : "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/articlepictures/grulac2/1.jpeg"),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  getTitle(index),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 100,
              ),
              const SizedBox(height: 60),
              Text(
                getText(index),
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.titreslidemainO;
      case 1:
        return AppLocalizations.of(context)!.titreslidemain1;
      case 2:
        return AppLocalizations.of(context)!.titreslidemain2;
      case 3:
        return AppLocalizations.of(context)!.titreslidemain3;
      case 4:
        return AppLocalizations.of(context)!.titreslidemain4;
      case 5:
        return AppLocalizations.of(context)!.titreslidemain5;
      case 6:
        return AppLocalizations.of(context)!.titreslidemain6;
      default:
        return '';
    }
  }

  String getText(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.texteslidemainO;
      case 1:
        return AppLocalizations.of(context)!.texteslidemain1;
      case 2:
        return AppLocalizations.of(context)!.texteslidemain2;
      case 3:
        return AppLocalizations.of(context)!.texteslidemain3;
      case 4:
        return AppLocalizations.of(context)!.texteslidemain4;
      case 5:
        return AppLocalizations.of(context)!.texteslidemain5;
      case 6:
        return AppLocalizations.of(context)!.texteslidemain6;
      default:
        return '';
    }
  }
}
