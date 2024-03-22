import 'package:dbop/login.dart';
import 'package:dbop/register.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class THome extends StatefulWidget {
  @override
  _THomeState createState() => _THomeState();
}

class _THomeState extends State<THome> {
  late VideoPlayerController _controller;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/background.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _checkLoginStatus();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkLoginStatus() async {
    // Vérifiez si l'utilisateur est connecté en utilisant votre logique de connexion
    // Par exemple, vous pouvez vérifier si un jeton d'authentification est stocké dans le stockage local
    bool isLoggedIn = await _yourLoginCheckFunction();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  Future<bool> _yourLoginCheckFunction() async {
    // Implémenter votre logique de vérification de connexion ici
    // Retourner true si l'utilisateur est connecté, false sinon
    return false;
  }

  Future<void> _logout() async {
    // Implémenter votre logique de déconnexion ici
    // Par exemple, vous pouvez supprimer le jeton d'authentification du stockage local
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Cause'),
        actions: [
          if (_isLoggedIn)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _logout();
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          VideoPlayer(_controller),
          if (!_isLoggedIn)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ).then((value) {
                    _checkLoginStatus();
                  });
                },
                child: Text('Connexion'),
              ),
            ),
          if (_isLoggedIn)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Bienvenue sur DBOP',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Ensemble, nous pouvons faire une différence.',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Nos rubriques',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      // La Fondation
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique La Fondation
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/la-fondation.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'La Fondation',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Enfance & International
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Enfance & International
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/enfance-international.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Enfance & International',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Handicap visuel
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Handicap visuel
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/handicap-visuel.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Handicap visuel',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Solos
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Solos
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/solos.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Solos',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Couples
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Couples
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/couples.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Couples',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Familles
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Familles
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/familles.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Familles',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Bible
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Bible
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/bible.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Bible',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Editions
                      GestureDetector(
                        onTap: () {
                          // Ajoutez votre logique ici pour la rubrique Editions
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/editions.jpg',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Editions',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          ).then((value) {
            _checkLoginStatus();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
