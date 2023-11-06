import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});


  @override
  Widget build(BuildContext context) {

    // Récupérez l'instance de traduction
    final localizations = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        children: [
          // Utilisez translateNavigationItem pour chaque élément
          ListTile(
            title: Text(localizations!.translateNavigationItem('accueil')),
            onTap: () {
              // Lien vers la page d'accueil
            },
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('actualite')),
            onTap: () {
              // Lien vers la page actualités
            }  
          ),
        
          ListTile(
            title: Text(localizations.translateNavigationItem('ambassade')),
            onTap: () {
              // Lien vers la page ambassade
            }
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('consulat')),
            onTap: () {
            }
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('presence')),
            onTap: () {
              // Lien vers la page de présence
            }
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('relation')),
            onTap: () {
              // Lien vers la page de relations
            }  
          ),
        
          ListTile(
            title: Text(localizations.translateNavigationItem('espacePresse')),
            onTap: () {
              // Lien vers la page espace presse
            }
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('venir')),
            onTap: () {
              // Lien vers la page venir
            }
          ),

          ListTile(
            title: Text(localizations.translateNavigationItem('decouvrir')),
            onTap: () {
              // Lien vers la page découvrir
            }
          ),
        
        ],
      ),
    );

  }

}


// Classe utilitaire pour récupérer les liens traduits ou non

class NavigationLinksUtil {

  // Version traduite en utilisant localizations
  static List<String> getTranslatedLinks(BuildContext context) {

    final localizations = AppLocalizations.of(context);

    return [
      localizations!.translateNavigationItem('accueil'),
      localizations.translateNavigationItem('actualite'),  
      localizations.translateNavigationItem('ambassade'),
      localizations.translateNavigationItem('consulat'),
      localizations.translateNavigationItem('presence'),
      localizations.translateNavigationItem('relation'),
      localizations.translateNavigationItem('espacePresse'),
      localizations.translateNavigationItem('venir'),
      localizations.translateNavigationItem('decouvrir')
    ];

  }

  // Version non traduite
  static List<String> getDefaultLinks() {
    return [
      'accueil',
      'actualite',
      'ambassade',
      'consulat',
      'presence',
      'relation', 
      'espacePresse',
      'venir',
      'decouvrir'  
    ];
  }

}