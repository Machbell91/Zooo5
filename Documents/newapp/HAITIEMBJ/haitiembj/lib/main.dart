import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haitiembj/layout/header.dart'; // Assurez-vous que le chemin d'importation est correct
import 'package:haitiembj/layout/footer.dart'; // Assurez-vous que le chemin d'importation est correct
import 'mobilehomepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('fr'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ht'), // Kreyol
        Locale('fr'), // Français
        Locale('ja'), // Japonais
        Locale('ko'), // Coréen
        Locale('zh'), // Chinois
      ],
      title: "HAJP",
      theme: ThemeData(
        // Thème de votre application
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void navigateToNarrowLayout(String lang) {
    // Ici, vous pouvez naviguer vers NarrowLayout avec la langue sélectionnée
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) { // Changez cette valeur en fonction de la taille minimale d'un mobile
          return MobileHomePage(onComplete: navigateToNarrowLayout);
        } else {
          return const WideLayout();
        }
      },
    );
  }
}


class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  const Expanded( // Utilisez un widget Expanded pour que le texte prenne toute la largeur disponible
                    flex: 2, // Donnez une valeur flex de 2 au texte pour qu'il occupe le double de l'espace disponible que les images
                    child: Text(
                      "AMBASSADE D'HAÏTI AU JAPON", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
