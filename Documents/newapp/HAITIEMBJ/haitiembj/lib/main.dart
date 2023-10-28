import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haitiembj/layout/header.dart'; // Assurez-vous que le chemin d'importation est correct
import 'package:haitiembj/layout/footer.dart'; // Assurez-vous que le chemin d'importation est correct
import 'mobilehomepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomMaterialLocalizations extends DefaultMaterialLocalizations {
  final Locale locale;

  CustomMaterialLocalizations(this.locale);

  @override
  String get moreButtonTooltip {
    switch (locale.languageCode) {
      case 'ht':
        return 'Plis'; // Fournissez votre propre traduction
      case 'ja':
        return 'もっと'; // Fournissez votre propre traduction
      case 'ko':
        return '더'; // Fournissez votre propre traduction
      case 'zh':
        return '更多'; // Fournissez votre propre traduction
      default:
        return super.moreButtonTooltip;
    }
  }
}

class CustomMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ht', 'ja', 'ko', 'zh'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async => CustomMaterialLocalizations(locale);

  @override
  bool shouldReload(CustomMaterialLocalizationsDelegate old) => false;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Locale _locale = Locale('fr', 'FR'); // I

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void navigateToNarrowLayout(BuildContext context, String lang) {
    Locale locale = Locale('fr', 'FR');
    switch (lang) {
      case 'Kreyòl':
        locale = Locale('ht', 'HT');
        break;
      case 'Français':
        locale = Locale('fr', 'FR');
        break;
      case 'English':
        locale = Locale('en', 'US');
        break;
      case '日本語':
        locale = Locale('ja', 'JP');
        break;
      case '한국어':
        locale = Locale('ko', 'KR');
        break;
      case '中国语文':
        locale = Locale('zh', 'CN');
        break;
    }
    setLocale(locale);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NarrowLayout()),
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
    '/NarrowLayout': (context) => NarrowLayout(),
    // ... other routes
        },
      locale: _locale,
      localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      AppLocalizations.delegate,
      CustomMaterialLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('ht', 'HT'), // Kreyòl
        const Locale('fr', 'FR'), // Français
        const Locale('en', 'US'), // English
        const Locale('ja', 'JP'), // 日本語
        const Locale('ko', 'KR'), // 한국어
        const Locale('zh', 'CN'), // 中国语文
      ],
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return MyHomePage(
              onComplete: (lang) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WideLayout(onComplete: (lang) {  },)),
                );
              },
            );
          } else {
            return MobileHomePage(
              onComplete: (lang) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NarrowLayout()),
                );
              },
              appContext: context,
              setLocale: setLocale, onLanguageChanged: (int ) {  },
            );
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required Null Function(dynamic lang) onComplete}) : super(key: key);

void navigateToNarrowLayout(BuildContext context, String lang) {
  Locale locale = Locale('fr', 'FR'); // Valeur par défaut
  switch (lang) {
    case 'Kreyòl':
      locale = Locale('ht', 'HT');
      break;
    case 'Français':
      locale = Locale('fr', 'FR');
      break;
    case 'English':
      locale = Locale('en', 'US');
      break;
    case '日本語':
      locale = Locale('ja', 'JP');
      break;
    case '한국어':
      locale = Locale('ko', 'KR');
      break;
    case '中国语文':
      locale = Locale('zh', 'CN');
      break;
  }
  MyApp.of(context)?.setLocale(locale);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NarrowLayout()),
  );
}


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) { // Changez cette valeur en fonction de la taille minimale d'un mobile
          return MobileHomePage(
          onComplete: (lang) => navigateToNarrowLayout(context, lang),
          appContext: context,
          setLocale: (locale) {
              // Do nothing or handle locale changes if needed
            }, onLanguageChanged: (int ) {  },         
          );
        } else {
          return WideLayout(onComplete: (lang) {  },);
        }
      },
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({super.key, required Null Function(dynamic lang) onComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          const Header(), // Utilisez votre widget Header ici
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home, size: 50),
                    Text('Home'),
                    Icon(Icons.business, size: 50),
                    Text('Business'),
                    Icon(Icons.school, size: 50),
                    Text('School'),
                    Icon(Icons.settings, size: 50),
                    Text('Settings'),
                  ],
                ),
              ),
            ),
          ),
          const Footer(), // Utilisez votre widget Footer ici
        ],
      ),
      )
    );
  }
}

class NarrowLayout extends StatefulWidget {
  @override
  _NarrowLayoutState createState() => _NarrowLayoutState();
}

class _NarrowLayoutState extends State<NarrowLayout> with SingleTickerProviderStateMixin {
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
        preferredSize: const Size.fromHeight(60.0), // increase height as needed
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false, // Cela empêche l'AppBar d'afficher automatiquement le bouton de menu burger
              backgroundColor: Color.fromARGB(255, 208, 205, 205),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded( // Utilisez un widget Expanded pour que l'image prenne toute la largeur disponible
                    child: Container(
                      width: 30.0, // change this to your desired width
                      height: 30.0, // change this to your desired height
                      child: Image.asset('assets/flaghaiti.png',), // replace with your first image asset
                    ), // replace with your first image asset
                  ),
                  Expanded( // Utilisez un widget Expanded pour que le texte prenne toute la largeur disponible
                    flex: 2, // Donnez une valeur flex de 2 au texte pour qu'il occupe le double de l'espace disponible que les images
                    child: Text(
                      AppLocalizations.of(context)?.mowbeel ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                      color: Color.fromARGB(255, 6, 18, 75), // change this to your desired color
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Expanded( // Utilisez un widget Expanded pour que l'image prenne toute la largeur disponible
                    child: Container(
		                      width: 30.0, // change this to your desired width
                      height: 30.0, // change this to your desired height
                      child: Image.asset('assets/japanflag.png',), // replace with your first image asset
                    ),
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
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(child: Container(color: Colors.white)),
          DraggableFloatingActionButton(
            data: 'Menu',
            child: FloatingActionButton(
              child: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            feedback: FloatingActionButton(
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

  DraggableFloatingActionButton({
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
        childWhenDragging:
            Container(), // Hide the original button when dragging
        feedback: widget.feedback,
        child: Builder( // Ajout du widget Builder ici
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
