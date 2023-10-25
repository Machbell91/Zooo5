import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Don't forget to import this

class MobileHomePage extends StatefulWidget {
  final Function(String) onComplete;

  MobileHomePage({required this.onComplete});

  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  String title = 'Ambassade d\'Haiti au Japon';
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;

  final List<String> languages = ['Kreyòl', 'Français', 'English', '日本語', '한국어', '中国语文'];
  final List<String> flagImages = [
    'flaghaiti.png',
    'franceflag.png',
    'flaguk.png',
    'japanflag.png',
    'floagcoree.png',
    'flagchine.png',
  ];

  void _changeLanguage(String lang) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        title = AppLocalizations.of(context)!.launchmobmainpagetitle + " - $lang";
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      widget.onComplete(lang);
    });
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: title,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/m2.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: screenHeight * 0.01), // Adjust the space between the image and the text
              Text(
                AppLocalizations.of(context)!.launchmobmainpagetitle,
                style: TextStyle(fontSize: screenHeight * 0.03), // Adjust the font size
              ),
              SizedBox(height: screenHeight * 0.05), // Adjust the space between the text and the carousel
              Container(
                height: screenHeight * 0.2, // Adjust the carousel height
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: languages.length + 2,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index % languages.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        return buildFlag(
                            languages[index % languages.length],
                            flagImages[index % languages.length],
                            screenHeight * 0.3); // Adjust carousel height
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05), // Adjust the space between the carousel and the copyright text
              Text(
                "Copyright2024",
                style: TextStyle(fontSize: screenHeight * 0.02), // Adjust the font size
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget buildFlag(String language, String flagImage, double containerHeight) {
final flagSize = containerHeight * 0.4; // Adjust image size
final spacing = 10.0;

return InkWell(
onTap: () {
_changeLanguage(language);
},
hoverColor: Colors.transparent, // make hover color transparent
focusColor: Colors.transparent, // make focus color transparent
child:
Container(
padding:
EdgeInsets.symmetric(vertical:
spacing, horizontal:
10),
decoration:
BoxDecoration(
border:
Border.all(color:
Colors.black.withOpacity(0.2)), // Black border
borderRadius:
BorderRadius.circular(10), // Adjust border radius
),
child:
SizedBox(
width:
flagSize * 
1.5,
height:
flagSize * 
1.5,
child:
Image.asset(
'/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/$flagImage',
width:
flagSize,
height:
flagSize,
),
),
),
);
}
}
