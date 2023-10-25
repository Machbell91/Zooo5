import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LateralNav extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onSelected;

  const LateralNav({
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    var localisations = AppLocalizations.of(context)!;

    double width = MediaQuery.of(context).size.width;
    bool isCompact = width < 600; 

    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        Container(
          width: isCompact ? width * 0.2 : width * 0.8,
          child: isCompact
            ? _buildCompactNav(localisations)
            : _buildFullNav(localisations)
        ),
      ],
    );
  }

  Widget _buildFullNav(AppLocalizations localisations) {
  return NavigationRail(
    selectedIndex: selectedIndex,
    onDestinationSelected: onSelected,
    destinations: [
      NavigationRailDestination(
        icon: const Icon(Icons.home),
        label: Text(localisations.accueil),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.article),
        label: Text(localisations.actualite),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.account_balance),
        label: Text(localisations.ambassade),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.diversity_3),
        label: Text(localisations.presence),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.diversity_2),
        label: Text(localisations.relation),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.folder_copy),
        label: Text(localisations.espacePresse),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.airplane_ticket),
        label: Text(localisations.venir),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.visibility),
        label: Text(localisations.decouvrir),
      ) 
    ],
  );
}


  Widget _buildCompactNav(AppLocalizations localisations) {
    return Drawer(
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onSelected,
        destinations: [
          NavigationRailDestination(
        icon: const Icon(Icons.home),
        label: Text(localisations.accueil),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.article),
        label: Text(localisations.actualite),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.account_balance),
        label: Text(localisations.ambassade),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.diversity_3),
        label: Text(localisations.presence),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.diversity_2),
        label: Text(localisations.relation),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.folder_copy),
        label: Text(localisations.espacePresse),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.airplane_ticket),
        label: Text(localisations.venir),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.visibility),
        label: Text(localisations.decouvrir),
      ) 
        ],
      ),
    );
  }
}

