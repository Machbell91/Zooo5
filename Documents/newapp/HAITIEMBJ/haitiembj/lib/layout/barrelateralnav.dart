import 'package:flutter/material.dart';

class LateralNav extends StatelessWidget {

  final int selectedIndex;
  final void Function(int) onSelected;

  const LateralNav({
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {

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
            ? _buildCompactNav()
            : _buildFullNav()
        ),
      
      ],
    );

  }

  Widget _buildFullNav() {

    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Accueil"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.mail),
          label: Text("Messages"), 
        ),
        NavigationRailDestination(
          icon: Icon(Icons.notifications),
          label: Text("Notifications"),
        ),
      ],
    );

  }

  Widget _buildCompactNav() {

    return Drawer(
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onSelected,
        destinations: const [
                NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Accueil"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.mail),
          label: Text("Messages"), 
        ),
        NavigationRailDestination(
          icon: Icon(Icons.notifications),
          label: Text("Notifications"),
        ),
        ],
      ),
    );

  }
}
