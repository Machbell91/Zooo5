import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Header extends StatefulWidget {
  final TextEditingController textController = TextEditingController();

  Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations =
        AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      padding: const EdgeInsets.only(
        top: 1, // Reduced from 20 to 10
        bottom: 5,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.kreyol ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.francais ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.japon ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.coreen ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.chinois ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  localizations?.anglais ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flaghaiti.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.ambassade ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.dHaiti ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3, width: 3),
                    Text(
                      localizations?.auJapon ?? '',
                      style: TextStyle(
                        fontSize: 14.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.lUnion ?? '',
                      style: TextStyle(
                        fontSize: 7.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.fait ?? '',
                      style: TextStyle(
                        fontSize: 7.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.laForce ?? '',
                      style: TextStyle(
                        fontSize: 7.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      localizations?.haitiAuJapon ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      localizations?.ambassadeDHaitiAuJapon ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/japanflag.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: localizations?.rechercher ?? '',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Animation gradient
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SizedBox(
              height: 5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.blue],
                  ),
                ),
              ),
            ),
          ),
          // Navigation
          NavigationLinks(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 5,
            margin: EdgeInsets.symmetric(vertical: 0.1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Colors.red, Colors.white],
                stops: [0.2, 0.5, 0.8],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class NavigationLinks extends StatefulWidget {
  const NavigationLinks({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _NavigationLinksState();
  }
}

class _NavigationLinksState extends State<NavigationLinks> {
  int hoveredIndex = -1;

  // Ajoutez cette liste d'éléments
  List<String> items = [
    'Accueil',
    'Actualité',
    'Ambassade',
    'Présence',
    'Relation',
    'Espace Presse',
    'Venir',
    'Découvrir'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 5, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items.map((String item) {
          int index = items.indexOf(item);

          return Flexible(
            child: InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  hoveredIndex = value ? index : -1;
                });
              },
              child: Container(
                width: 120,
                margin: EdgeInsets.symmetric(horizontal: 12),
                transform: Matrix4.identity()
                  ..scale(hoveredIndex == index ? 1.1 : 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(height: 5),
                      Text(
                        item,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
