import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haitiembj/layout/header.dart';
import 'package:haitiembj/layout/footer.dart';
import 'mobilehomepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      ['ht', 'ja', 'ko', 'zh'].contains(locale.languageCode);

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
    setState(() {
      _locale = locale;
    });
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
      MaterialPageRoute(builder: (context) => const NarrowLayout()),
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
        '/NarrowLayout': (context) => const NarrowLayout(),
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
                    MaterialPageRoute(builder: (context) => const NarrowLayout()),
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
      MaterialPageRoute(builder: (context) => const NarrowLayout()),
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
  final Null Function(dynamic) onComplete;

  const WideLayout({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Header(),
                const Row(
                  children: [
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Center(
                        child: Text('Your Center Content'),
                      ),
                    ),
                  ],
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NarrowLayout extends StatefulWidget {
  const NarrowLayout({super.key});

  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

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
  Widget build(BuildContext context) {
    return Scaffold(
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
          DraggableFloatingActionButton(
            data: 'Menu',
            feedback: FloatingActionButton(
              child: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            child: FloatingActionButton(
              child: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Navigation'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Business'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('School'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
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

class DraggableFloatingActionButton extends StatefulWidget {
  final Widget child;
  final Widget feedback;
  final Object data;

  const DraggableFloatingActionButton({super.key, 
    required this.child,
    required this.feedback,
    required this.data,
  });

  @override
  _DraggableFloatingActionButtonState createState() =>
      _DraggableFloatingActionButtonState();
}

class _DraggableFloatingActionButtonState
    extends State<DraggableFloatingActionButton> {
  final GlobalKey key = GlobalKey();
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable<Object>(
        key: key,
        data: widget.data,
        childWhenDragging: Container(),
        feedback: widget.feedback,
        child: FloatingActionButton(
          child: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
      ),
    );
  }
}
