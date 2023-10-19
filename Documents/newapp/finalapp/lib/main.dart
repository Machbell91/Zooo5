import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finalapp/layouts/header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalapp/layouts/article.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(primary: const Color.fromARGB(255, 247, 41, 41), seedColor: const Color.fromARGB(255, 237, 180, 236)),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
    var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
switch (selectedIndex) {
  case 0:
    page = const GeneratorPage();
    break;
  case 1:
    page = const Placeholder();
    break;
  default:
    throw UnimplementedError('no widget for $selectedIndex');
}
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.article),
                      label: Text('Actualité'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.account_balance),
                      label: Text('Ambassade'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.diversity_3),
                      label: Text('Présence Haïtienne'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.diversity_2),
                      label: Text('Relations Bilatérales'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.folder_copy),
                      label: Text('Espace Presse'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.airplane_ticket),
                      label: Text('Venir en Haïti'),
                    ),
                                        NavigationRailDestination(
                      icon: Icon(Icons.visibility),
                      label: Text('Découvrir Haïti'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return SafeArea(
      child: Column(
        children: [
          // Positionnez le `Header` tout en haut.
          const Positioned(
            top: 0,
            child: Header(),
          ),

          // Ajoutez le widget `CarouselSlider` ici.
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.white),
                ),
                child: Image.asset(
                  'assets/images/image$i.png',
                  width: getImageWidth(context), // Largeur dynamique des images
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          Container(
  padding: const EdgeInsets.only(top: 20),
  height: 400,
  child: ArticlePage(), 
),
          // Retirez le widget `BigCard` ici.
        ],
      ),
    );
  }

// Correction de l'erreur de rendu des images
static double getImageWidth(BuildContext context) {
  return MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.horizontal; // Largeur dynamique des images
}
}
