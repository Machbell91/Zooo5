import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = MediaQuery.of(context).size.width;

        return Container(
          color: const Color.fromARGB(255, 243, 215, 243),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: screenWidth < 1200 ? Axis.horizontal : Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHoverableColumn(
                      context,
                      "Haïti Au Japon",
                      ["Liens utiles", "Contactez-nous", "Mentions légales", "Plan du site"],
                      '/liens_utiles',
                    ),
                    const SizedBox(width: 40),
                    _buildHoverableColumn(
                      context,
                      "Confidentialité",
                      ["Politique de confidentialité", "Gestion des cookies", "Accessibilité : non conforme"],
                      '/politique_confidentialite',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/outils');
                      },
                      child: Center(
                        child: Image.asset(
                          '/Users/matthiaspierre/Documents/newapp/finalapp/assets/footer.png',
                          height: 180,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    _buildHoverableColumn(
                      context,
                      "Outils",
                      ["Augmenter/diminuer police", "S’inscrire aux flux RSS"],
                      '/outils',
                    ),
                    const SizedBox(width: 40),
                    _buildHoverableColumn(
                      context,
                      "Liens institutionnels",
                      ["france.fr", "service-public.fr", "gouvernement.fr", "data.gouv.fr", "legifrance.gouv.fr", "diplomatie.gouv.fr"],
                      '/liens_institutionnels',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHoverableColumn(
    BuildContext context,
    String title,
    List<String> items,
    String route,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 63, 115),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            bool isHovering = false;
            bool isClicked = false;

            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => isHovering = true),
                      onExit: (_) => setState(() => isHovering = false),
                      child: GestureDetector(
                        onTapDown: (_) => setState(() => isClicked = true),
                        onTapUp: (_) => setState(() => isClicked = false),
                        onTapCancel: () => setState(() => isClicked = false),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: isClicked ? Colors.red : (isHovering ? Colors.blue : Colors.black),
                            decoration: isClicked ? TextDecoration.underline : TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

