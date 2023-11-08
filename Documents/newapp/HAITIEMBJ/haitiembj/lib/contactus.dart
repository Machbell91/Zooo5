import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haitiembj/layout/footer.dart';
import './layout/header.dart';
import '../main.dart';

class ContactusPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const ContactusPages({
    super.key,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _ContactusPagesState createState() => _ContactusPagesState();
}

class _ContactusPagesState extends State<ContactusPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Header(
                onLanguageChanged: (Locale newLocale) {
                  MyApp.of(context)?.setLocale(newLocale);
                  onComplete(newLocale);
                },
                locale: const Locale('fr', 'FR'),
                width: double.infinity,
                height: 400,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)?.mowbeel ?? '',
                                      style: const TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 20.0),
                                    // Ajout d'une image classique
                                    Image.asset(
                                      'chemin_vers_votre_image.jpg',
                                      fit: BoxFit.cover, // ou BoxFit.contain selon vos besoins
                                      width: 200, // ou une autre largeur selon vos besoins
                                      height: 200, // ou une autre hauteur selon vos besoins
                                    ),
                                    const SizedBox(height: 20.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.adresseamb ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        "No. 38 Kowa Building, Room 906\n\n\ 4-12-24, Nishi-Azabu, Minato-ku\n\n\ Tokyo 106-0031",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.telamb ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        "(+81) 3-3486-7096",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.faxamb ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        "(+81) 3-3486-7070",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.eemailamb ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        "amb.japon@diplomatie.ht",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.scmdamb ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child:
                                      Icon(Icons.facebook),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 370.0),
                                      child:Icon(FontAwesomeIcons.twitter),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.opngamb0 ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 370.0),
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.opngamb1 ?? '',
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onComplete(Locale newLocale) {}
}
