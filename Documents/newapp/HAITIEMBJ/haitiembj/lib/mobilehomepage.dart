import 'package:flutter/material.dart';
import 'package:haitiembj/main.dart';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileHomePage extends StatefulWidget {
  final Function(String) onComplete;
  final BuildContext appContext;
  final Function(Locale) setLocale;
  final Function(int) onLanguageChanged;

  MobileHomePage({
    required this.onComplete,
    required this.appContext,
    required this.setLocale,
    required this.onLanguageChanged,
  });

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {

  ValueNotifier<int> _selectedLanguageNotifier = ValueNotifier<int>(0);
  ValueNotifier<int?> _hoveredFlagNotifier = ValueNotifier<int?>(null);

  final List<String> languages = [
    'Kreyòl',
    'Français',
    'English',
    '日本語',
    '한국어',
    '中国语文',
  ];

  final List<String> languageCodes = [
    'ht',
    'fr',
    'en',
    'ja',
    'ko',
    'zh',
  ];

  late List<String> flagPaths;
  String _randomImagePath = '';  

  @override
  void initState() {
    super.initState();

    flagPaths = [
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/flaghaiti.png",
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/franceflag.png",
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/flaguk.png",
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/japanflag.png", 
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/floagcoree.png",
      "/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/mobilepicturehomepage/flagchine.png",
    ];

    final random = Random();
    final imageNumber = random.nextInt(5) + 1;
    _randomImagePath = 'assets/images/image_$imageNumber.png';
  }

  void naviguerVersPageActuelle() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NarrowLayout()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [

            Image.asset(_randomImagePath),
            
            ValueListenableBuilder<int>(
              valueListenable: _selectedLanguageNotifier,
              builder: (context, value, child) {
                return Text(
                  AppLocalizations.of(context)?.mowbeel ?? '',
                  locale: Locale(languageCodes[value]),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.black,
                    letterSpacing: 0.5,
                    height: 1.5,
                    ),
                );
              },
            ),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(
                languages.length,
                (index) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      _hoveredFlagNotifier.value = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _hoveredFlagNotifier.value = null;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLanguageNotifier.value = index;
                        MyApp.of(context)?.setLocale(Locale(languageCodes[index]));
                      });
                      Future.delayed(Duration(seconds: 1), () {
                      naviguerVersPageActuelle();
                    });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _hoveredFlagNotifier.value == index ? Colors.blueAccent : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: _hoveredFlagNotifier.value == index ? Colors.blue.withOpacity(0.3) : Colors.transparent,
                      ),
                      child: Image.asset(
                        flagPaths[index],
                        fit: BoxFit.contain,
                        height: 35 / 2, 
                        width: 35 / 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("© 2024 Ambassade d'Haïti au Japon, TOKYO. Tout Droit Réservé."),
          
          ],
        ),
      ),
    );

  }

}
