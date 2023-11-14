import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';  
import 'package:haitiembj/layout/footer.dart';
import './layout/header.dart';
import '../main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NationalHymnPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const NationalHymnPages({
    super.key, 
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _NationalHymnPagesState createState() => _NationalHymnPagesState();
}

class _NationalHymnPagesState extends State<NationalHymnPages> {

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'https://youtu.be/bvMjjsMCKyo?si=BjGNJ2wG4eRmpNYj&t=14', 
    flags: const YoutubePlayerFlags(
      autoPlay: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                              AppLocalizations.of(context)?.nationalhymn ?? '',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Image.asset(
                              'assets/flaghaiti.png',
                              fit: BoxFit.cover,
                              width: 700,
                              height: 400,
                            ),
                            YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              width: 300,
                              aspectRatio: 3/2, 
                            ),                           
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [                            
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 150),
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.hymnh ?? '',
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 150),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.justify,
                                        AppLocalizations.of(context)?.hymnt ?? '',
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                    ),
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
    );
  }

  void onComplete(Locale newLocale) {}
  
}