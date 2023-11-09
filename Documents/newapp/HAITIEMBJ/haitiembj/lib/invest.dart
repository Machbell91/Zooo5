import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:haitiembj/layout/footer.dart';
import './layout/header.dart';
import '../main.dart';

class InvestPages extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale locale;
  const InvestPages({
    super.key,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _InvestPagesState createState() => _InvestPagesState();
}

class _InvestPagesState extends State<InvestPages> {

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
                              AppLocalizations.of(context)?.investhaiti ?? '',
                              style: const TextStyle(                              
                                fontSize: 20.0,                                 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Image.asset(
                              '/Users/matthiaspierre/Documents/newapp/HAITIEMBJ/haitiembj/assets/slogocolor.png', 
                              fit: BoxFit.cover, 
                              width: 50, 
                              height: 50,
                              
                            ),
                            
                            const SizedBox(height: 100.0),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 370.0),
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
    );   
  }

  void onComplete(Locale newLocale) {}

}