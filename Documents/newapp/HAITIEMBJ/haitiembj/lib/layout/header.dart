import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Header extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final TextEditingController textController = TextEditingController();
  final Locale locale;
  

  Header({Key? key, required this.onLanguageChanged, required this.locale}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void onLanguageSelected(String lang) {
  // ... reste du code
  widget.onLanguageChanged(lang as Locale); // Ajoutez cette ligne
}


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
    final AppLocalizations? localizations = AppLocalizations.of(context);

    return Container(
      constraints: BoxConstraints(maxHeight: 400),
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
              onPressed: () {
                widget.onLanguageChanged(Locale('ht', 'HT')); // Remplacez par la langue souhaitée
              },
              child: Text(
                localizations?.kreyol ?? '',
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
              TextButton(
              onPressed: () {
                widget.onLanguageChanged(Locale('fr', 'FR')); // Remplacez par la langue souhaitée
              },
                child: Text(
                  localizations?.francais ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(Locale('ja', 'JP'));
                },
                child: Text(
                  localizations?.japon ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(Locale('ko', 'KR'));
                },
                child: Text(
                  localizations?.coreen ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                    onPressed: () {
                      widget.onLanguageChanged(Locale('zh', 'CN'));
                    },
                child: Text(
                  localizations?.chinois ?? '',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.onLanguageChanged(Locale('en', 'US'));
                },
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
                        fontSize: 10.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.fait ?? '',
                      style: TextStyle(
                        fontSize: 10.0 *
                            (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      localizations?.laForce ?? '',
                      style: TextStyle(
                        fontSize: 10.0 *
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
                        fontSize: 16.0 *
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
                        fontSize: 14.0 *
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

  late List<String> items;

  @override
  Widget build(BuildContext context) {
    List<String> itemKeys = ['accueil', 'actualite', 'ambassade', 'presence', 'relation', 'espacePresse', 'venir', 'decouvrir'];
    items = itemKeys.map((key) => AppLocalizations.of(context)?.translateNavigationItem(key) ?? key).toList();
  

  
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
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                    horizontal: 11,
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
                      SizedBox(height: 7),
                      Text(
                        AppLocalizations.of(context)?.translateNavigationItem(items[index]) ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
