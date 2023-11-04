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
  // Update selectedIndex
}

class CustomMaterialLocalizations extends DefaultMaterialLocalizations {
  final Locale locale;
  

  CustomMaterialLocalizations(this.locale);

  @override
  String get moreButtonTooltip {
    switch (locale.languageCode) {
      case 'ht':
        return 'Plis'; // Provide your own translation
      case 'ja':
        return 'もっと'; // Provide your own translation
      case 'ko':
        return '더'; // Provide your own translation
      case 'zh':
        return '更多'; // Provide your own translation
      case 'fr':
        return 'Plus'; // Provide your own translation
      case 'en':
        return 'More'; // Provide your own translation
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
    // Mettez à jour l'interface utilisateur en appelant setState()
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
        // Logique pour le changement de langue
      },
      locale: const Locale('fr', 'FR'), // Remplacez par la langue souhaitée
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
            // Logique pour le changement de langue
          },
          locale: const Locale('fr', 'FR'), // Remplacez par la langue souhaitée
        ),
        // ... other routes
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
                      // Logique pour le changement de langue
                    },
                    locale: const Locale('fr', 'FR'), // Remplacez par la langue souhaitée
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
  const MyHomePage({super.key, required Null Function(dynamic lang) onComplete});

  void navigateToNarrowLayout(BuildContext context, String lang) {
    Locale locale = const Locale('fr', 'FR'); // Default value
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
    // Logique pour le changement de langue
  },
  locale: const Locale('fr', 'FR'), // Remplacez par la langue souhaitée
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
              // Do nothing or handle locale changes if needed
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
                    onComplete(newLocale); // Appeler onComplete avec la nouvelle locale
                  },
                  locale: const Locale('fr', 'FR'),
                  width: double.infinity,
                  height: 400,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AnimatedSlider(),
                  ),
                ),
                // Padding entre AnimatedSlider et Carousel
                const Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),

                // Deux colonnes en dessous de AnimatedSlider
                const Expanded(
                  child: Row(
                    children: [
                      // La première colonne avec le Carousel (40% de la largeur)
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Aligner au début (haut)
                          children: [
                            // Mettez ici d'autres widgets si nécessaire
                            AspectRatio(
                              aspectRatio: 0.8,
                              child: Carousel(),
                            ),
                          ],
                        ),
                      ),
                      // La deuxième colonne avec autre chose (60% de la largeur)
                      Expanded(
                        flex: 6,
                        child: Artika(locale: Locale('fr''FR'),),
                      ),
                    ],
                  ),
                ),
                // Footer à 100% de la largeur horizontale, en bas de la page
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












class NarrowLayout extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const NarrowLayout({super.key, required this.onLanguageChanged, required this.locale});

  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  late List<String> items;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue,
    ).animate(_controller);
  }

  @override
  void didUpdateWidget(NarrowLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.locale != oldWidget.locale) {
      // Ne rien mettre ici
    }
  }

  Draggable<Object> draggableFloatingActionButton() {
    return Draggable<Object>(
      data: 'Menu',
      childWhenDragging: Container(),
      feedback: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      child: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      onDraggableCanceled: (velocity, offset) {
        setState(() {
          // Update the position as needed
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> itemKeys = ['accueil', 'actualite', 'ambassade', 'presence', 'relation', 'espacePresse', 'venir', 'decouvrir'];
    items = itemKeys.map((key) => AppLocalizations.of(context)?.translateNavigationItem(key) ?? key).toList();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return WideLayout(onComplete: (lang) {});
            } else {
              return Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: const Color.fromARGB(255, 208, 205, 205),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Image.asset('assets/flaghaiti.png'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            AppLocalizations.of(context)?.mowbeel ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 6, 18, 75),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Image.asset('assets/japanflag.png'),
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _colorAnimation,
                    builder: (context, child) => Container(
                      height: 2.0,
                      color: _colorAnimation.value!,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(child: Container(color: Colors.white)),
          draggableFloatingActionButton(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: items.map((String item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                // Logic for handling click on Drawer link
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
