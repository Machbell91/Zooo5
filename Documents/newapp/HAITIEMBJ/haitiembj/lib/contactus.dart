import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                                Text(
                                  AppLocalizations.of(context)?.investhaiti ?? '',
                                  style: const TextStyle(
                                    fontSize: 20.0,
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
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    textAlign: TextAlign.justify,
                                    AppLocalizations.of(context)?.investinhaititxt ?? '',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
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
