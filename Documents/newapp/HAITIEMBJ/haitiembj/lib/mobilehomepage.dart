import 'package:flutter/material.dart';


class MobileHomePage extends StatefulWidget {
  final Function(String) onComplete;

  MobileHomePage({required this.onComplete});
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {

  String title = 'Ambassade d\'Haiti au Japon';

  void _changeLanguage(String lang) {
    setState(() {
      title = 'Ambassade d\'Haiti au Japon - $lang';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('Kreyòl');
                    },
                    child: Image.asset(
                      'assets/fr.jpg', 
                      width: 100, 
                      height: 100
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('Français');
                    },
                    child: Image.asset(
                      'assets/en.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('日本');
                    },
                    child: Image.asset(
                      'assets/es.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('한글');
                    },
                    child: Image.asset(
                      'assets/ht.jpg',
                      width: 100, 
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('中国语文');
                    },
                    child: Image.asset(
                      'assets/ht.jpg',
                      width: 100, 
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      _changeLanguage('English');
                    },
                    child: Image.asset(
                      'assets/ht.jpg',
                      width: 100, 
                      height: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}