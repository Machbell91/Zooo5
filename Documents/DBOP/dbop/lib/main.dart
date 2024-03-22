import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragon Ball & One Piece',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dragon Ball & One Piece', key: UniqueKey()),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _showLoginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connexion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Mot de passe'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Connexion'),
              onPressed: () {
                // TODO: implémenter la logique de connexion
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/uuuuuu.png',
              width: 300,
              height: 250,
            ),
            const Text(
              'Bienvenue sur le site web DBOP!',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showLoginDialog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.login),
                  SizedBox(width: 10),
                  Text('Connexion'),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person_add),
                  SizedBox(width: 10),
                  Text('S\'enregistrer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LoginPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Connexion'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
TextFormField(
decoration: InputDecoration(
labelText: 'Adresse e-mail',
),
),
SizedBox(height: 16.0),
TextFormField(
decoration: InputDecoration(
labelText: 'Mot de passe',
),
obscureText: true,
),
SizedBox(height: 16.0),
ElevatedButton(
onPressed: () {
// TODO: Implémenter la logique de connexion
},
child: Text('Connexion'),
),
],
),
),
);
}
}

class RegisterPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('S\'enregistrer'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
TextFormField(
decoration: InputDecoration(
labelText: 'Nom d\'utilisateur',
),
),
SizedBox(height: 16.0),
TextFormField(
decoration: InputDecoration(
labelText: 'Adresse e-mail',
),
),
SizedBox(height: 16.0),
TextFormField(
decoration: InputDecoration(
labelText: 'Mot de passe',
),
obscureText: true,
),
SizedBox(height: 16.0),
ElevatedButton(
onPressed: () {
// TODO: Implémenter la logique d'inscription
},
child: Text('S\'enregistrer'),
),
],
),
),
);
}
}
