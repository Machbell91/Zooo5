import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haitiembj/layout/header.dart';
import 'package:haitiembj/layout/footer.dart';
import 'mobilehomepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './layout/urganncmnt.dart';
import './layout/mainslider.dart';
import './layout/listingarticle.dart';
int selectedIndex = 0;

void onSelected(int index) {
}

class CustomMaterialLocalizations extends DefaultMaterialLocalizations {
  final Locale locale;
  

  CustomMaterialLocalizations(this.locale);

  @override
  String get moreButtonTooltip {
    switch (locale.languageCode) {
      case 'ht':
        return 'Plis'; 
      case 'ja':
        return 'もっと';
      case 'ko':
        return '더';
      case 'zh':
        return '更多';
      case 'fr':
        return 'Plus';
      case 'en':
        return 'More';
      default:
        return super.moreButtonTooltip;
    }
  }
}

class CustomMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['ht', 'ja', 'ko', 'zh','fr','en'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      CustomMaterialLocalizations(locale);

  @override
  bool shouldReload(CustomMaterialLocalizationsDelegate old) => false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fr', 'FR');

  void setLocale(Locale locale) {
    print("Setting locale to: ${locale.languageCode}");
    setState(() {
      _locale = locale;
    });
  }

  void onLanguageChanged(Locale locale) {
    print("Changement de langue vers : ${locale.languageCode}");
    setLocale(locale);
    setState(() {});
  }

  void navigateToNarrowLayout(BuildContext context, String lang) {
    Locale locale = const Locale('fr', 'FR');
    switch (lang) {
      case 'Kreyòl':
        locale = const Locale('ht', 'HT');
        break;
      case 'Français':
        locale = const Locale('fr', 'FR');
        break;
      case 'English':
        locale = const Locale('en', 'US');
        break;
      case '日本語':
        locale = const Locale('ja', 'JP');
        break;
      case '한국어':
        locale = const Locale('ko', 'KR');
        break;
      case '中国语文':
        locale = const Locale('zh', 'CN');
        break;
    }
    setLocale(locale);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  NarrowLayout(
      onLanguageChanged: (locale) {
      },
      locale: const Locale('fr', 'FR'),
    )),
        );
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/NarrowLayout': (context) =>  NarrowLayout(
          onLanguageChanged: (locale) {
          },
          locale: const Locale('fr', 'FR'),
        ),
      },
      locale: _locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
        CustomMaterialLocalizationsDelegate()
      ],
      supportedLocales: const [
        Locale('ht', 'HT'), // Kreyòl
        Locale('fr', 'FR'), // Français
        Locale('en', 'US'), // English
        Locale('ja', 'JP'), // 日本語
        Locale('ko', 'KR'), // 한국어
        Locale('zh', 'CN'), // 中国语文
      ],
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return WideLayout(onComplete: (lang) {});
          } else {
            return SizedBox(
              width: 600,
              child: MobileHomePage(
                onComplete: (lang) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  NarrowLayout(
                    onLanguageChanged: (locale) {
                    },
                    locale: const Locale('fr', 'FR'), 
                    )),
                  );
                },
                appContext: context,
                setLocale: setLocale,
                onLanguageChanged: (int) {},
              ),
            );
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required Null Function(dynamic lang) onComplete, required Null Function(dynamic locale) onLanguageChanged, required Locale locale});

  void navigateToNarrowLayout(BuildContext context, String lang) {
    Locale locale = const Locale('fr', 'FR'); 
    switch (lang) {
      case 'Kreyòl':
        locale = const Locale('ht', 'HT');
        break;
      case 'Français':
        locale = const Locale('fr', 'FR');
        break;
      case 'English':
        locale = const Locale('en', 'US');
        break;
      case '日本語':
        locale = const Locale('ja', 'JP');
        break;
      case '한국어':
        locale = const Locale('ko', 'KR');
        break;
      case '中国语文':
        locale = const Locale('zh', 'CN');
        break;
    }
    MyApp.of(context)?.setLocale(locale);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  NarrowLayout(
  onLanguageChanged: (locale) {
  },
  locale: const Locale('fr', 'FR'),
)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (MediaQuery.of(context).size.width < 600) {
          return MobileHomePage(
            onComplete: (lang) => navigateToNarrowLayout(context, lang),
            appContext: context,
            setLocale: (locale) {
            },
            onLanguageChanged: (int) {},
          );
        } else {
          return WideLayout(onComplete: (lang) {});
        }
      },
    );
  }
}

//WEBSITE VERSION

class WideLayout extends StatelessWidget {
  final Null Function(dynamic lang) onComplete;

  const WideLayout({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double increasedHeight = screenHeight * 2.3;

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: increasedHeight,
          ),
          child: SizedBox(
            height: increasedHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Header(
                  onLanguageChanged: (Locale newLocale) {
                    MyApp.of(context)?.setLocale(newLocale);
                    onComplete(newLocale);
                  },
                  locale: const Locale('fr', 'FR'),
                  width: double.infinity,
                  height: 400,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AnimatedSlider(height: 300, width: 1300,),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 0.8,
                              child: Carousel(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Artika(locale: Locale('fr''FR'),),
                      ),
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Footer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//MOBILE VERSION


class LinearGradientTween extends Tween<LinearGradient> {
  LinearGradientTween({required LinearGradient begin, required LinearGradient end})
      : super(begin: begin, end: end);

  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t)!;
}

class NarrowLayout extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const NarrowLayout({
    Key? key,
    required this.onLanguageChanged,
    required this.locale,
  }) : super(key: key);

  @override
  State<NarrowLayout> createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<LinearGradient> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds:15),
      vsync: this,
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_animationController);

    _colorAnimation = LinearGradientTween(
      begin: LinearGradient(colors: [const Color.fromARGB(255, 219, 37, 24)!, const Color.fromARGB(255, 241, 241, 240)!]),
      end: LinearGradient(colors: [const Color.fromARGB(255, 247, 247, 247)!, const Color.fromARGB(255, 59, 82, 255)!]),
    ).animate(_animationController) as Animation<LinearGradient>;

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.asset(
                    'assets/flaghaiti.png',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    AppLocalizations.of(context)?.mowbeel ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.asset(
                    'assets/japanflag.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 100,
                  height: 10.0,
                  decoration: BoxDecoration(
                    gradient: _colorAnimation.value,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                    AppLocalizations.of(context)?.consulat ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 24, 94),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 150,
                  height: 8.0,
                  decoration: BoxDecoration(
                    gradient: _colorAnimation.value,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                    AppLocalizations.of(context)?.ambassade ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 24, 94),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 200,
                  height: 6.0,
                  decoration: BoxDecoration(
                    gradient: _colorAnimation.value,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                    AppLocalizations.of(context)?.venir ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color:Color.fromARGB(255, 0, 24, 94),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 250,
                  height: 4.0,
                  decoration: BoxDecoration(
                    gradient: _colorAnimation.value,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                    AppLocalizations.of(context)?.decouvrir ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 24, 94),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                    ),
                  ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 300,
                  height: 2.0,
                  decoration: BoxDecoration(
                    gradient: _colorAnimation.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}








