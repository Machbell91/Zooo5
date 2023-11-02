import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class AnimatedSlider extends StatefulWidget {
  @override
  _AnimatedSliderState createState() => _AnimatedSliderState(); 
}

class _AnimatedSliderState extends State<AnimatedSlider> {

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8
    );
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
            color: Colors.black,
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return _buildPage(index); 
            },
          ),
        ),
        
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          DotsIndicator(
              decorator: const DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: Colors.redAccent,
              ), dotsCount: 2,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPage(int index) {
    return Row(
      children: [
        Image.asset(index.isEven ? "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/articlepictures/franco/1.jpeg" : "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/articlepictures/grulac2/1.jpeg"),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Text(
                  index.isEven ? "Mois de la Francophonie" : "Reunion Du GRULAC",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                color: Colors.white,
                width: 100,
              ),
              const SizedBox(height: 60),
              const Text(
                "Contenu du slide",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),  
      ],
    );
  }

}