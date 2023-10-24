import 'package:flutter/material.dart';
import 'dart:async';

class Article {
  final List<String> imagePaths;
  final String title;
  final String imgPath;
  final String summary;
  final String content;

  Article({
    required this.title,
    required this.imgPath,
    required this.summary,
    required this.content,
    required this.imagePaths,
  });
}

class ArticlePage extends StatefulWidget {
  static final List<Article> articles = [
    Article(
      title: "Grand Bazar annuel du GRULAC",
      imgPath: "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/1.jpg",
      summary: "Le dimanche 23 octobre 2022",
      content: "Le dimanche 23 octobre 2022, l’Ambassade de la République d'Haïti au Japon a pris part à l'organisation du Grand Bazar annuel du GRULAC (Group of Latin America and the Caribbean). À l’occasion de cette belle journée de célébration, la culture haïtienne (art, artisanat, musique et gastronomie) a été mise en valeur.",
      imagePaths: [
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/2.jpg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/3.jpg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/4.jpg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/5.jpg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/6.jpg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/octobre22/7.jpg",
      ]

    ),
    Article(
      title: "MIKABEN", 
      imgPath: "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/mika.jpeg",
      summary: "Ayiti pèdi yon pitit li ki te renmen l anpil.",
      content: "Ayiti pèdi yon pitit li ki te renmen l anpil. Travay atis la reflete lanmou li pou Ayiti. Pou sa, mèsi Mikaben. N'ap sonje w etènèlman atravè zèv ou yo.Kouraj pou nou chak ki afekte ak nan lapèn. Rest in Power Michael Benjamin!",
      imagePaths: [
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/2.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/3.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/4.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/5.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/mikaben/maxresdefault.jpg",
      ]
    ),
    Article(
      title: "Kids Forest",
      imgPath: "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/Kidsforest/1.jpeg",
      summary: "le 16 août 2022 ",
      content: "L’Ambassade d’Haïti au Japon a reçu le 16 août 2022 la visite des élèves du programme de garde après école « Kids Forest ». La Mission a réalisé une belle journée de d’interaction avec les élèves et les enseignants de Kids Forest. Le groupe, treize élèves âgés entre 7 et 10 ans et quatre enseignants, est arrivé à l’Ambassade dans l’après-midi. Une séance de présentation sur l’histoire, la culture et les traditions haïtiennes a eu lieu dans la salle de conférence, puis le groupe a effectué une visite guidée des locaux de la Mission avant de prendre congé.Cette visite s’inscrit dans le cadre de l’objectif de la Mission de promouvoir les richesses culturelles et historiques d’Haïti auprès des jeunes japonais.  En effet, ces opportunités d’échange et de partage permettent aux jeunes de découvrir d’autres cultures et ouvrir leurs horizons sur le monde.",
      imagePaths: [
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/Kidsforest/3.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/Kidsforest/2.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/Kidsforest/1.jpeg",
      ]
    ),
    Article(
      title: "GRULAC",
      imgPath: "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/grulac2/2.jpeg",
      summary: " 20 et 22 juin 2022",
      content: "’Ambassadeur de la République d’Haïti au Japon, M. Helph Monod HONORAT, a pris part, les 20 et 22 juin 2022, à une rencontre de haut niveau organisée par le Ministre des Affaires Étrangères du Japon, S.E.M.  Yoshimasa HAYASHI, avec les chefs de mission du groupe des Pays Latino-américains et Caribéens (GRULAC). Cette initiative s’inscrit dans l’objectif de présenter l’agenda diplomatique du Japon aux missions des pays de l’Amérique Latine et de la Caraïbe pour l’année fiscale 2022-2023. Le Ministre HAYASHI qui était accompagné de la directrice générale de la région de l’Amérique Latine et des Caraïbes, Ambassadeur Maki KOBAYASHI, en a profité pour remercier les pays latino-américains et caribéens de leur soutien à la suite de l’élection du Japon au Conseil de Sécurité des Nations Unies durant la période 2023-2024 comme membre non-permanent.  Il a renouvelé l’engagement et la disponibilité du gouvernement japonais à poursuivre et à renforcer ses   efforts de soutien aux Pays Latino-américains et Caribéens à travers des projets de coopération technique, l’envoi d’experts et le financement pour le développement.  Il a également souligné l’importance pour le Japon du GRULAC qui regroupe des partenaires importants avec lesquels le Japon partage des valeurs fondamentales comme la démocratie et les droits humains. L’Ambassadeur HONORAT, dans son intervention, a saisi l’occasion pour mettre en exergue l’efficacité de la coopération japonaise en Haïti tout en présentant, au nom du Gouvernement haïtien, ses mots de gratitude pour l’intérêt particulier que le Japon porte à Haïti. Il a formulé, en outre, son souhait de voir la coopération japonaise inclure, dans un avenir proche, des investissements relatifs à la culture, la science, l’innovation et la technologie pouvant contribuer à la modernisation des infrastructures et au   développement durable d’Haïti. L'ambassadeur a aussi fait remarquer que l’appui du Japon sera toujours très utile aux pays de la Caraïbe pour   résoudre des problèmes liés au réchauffement climatique et aux catastrophes naturelles.",
      imagePaths: [
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/grulac2/2.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/grulac2/1.jpeg",
      ]
    ),
    Article(
      title: "Francophonie",
      imgPath: "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/2.jpeg",
      summary: "Mois de la francophonie 2022",
      content: "Le vendredi 25 Mars 2022, dans une ambiance conviviale, l’Ambassade de la République d'Haïti au Japon a organisé la projection du film “Gouverneurs de la Rosée dans le cadre du “mois de la francophonie. À l’occasion de cette belle soirée de célébration, la culture haïtienne (art, artisanat, musique et gastronomie) a été mise en valeur.",
      imagePaths: [
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/1.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/3.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/4.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/5.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/6.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/7.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/8.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/9.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/10.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/11.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/12.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/13.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/14.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/15.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/16.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/17.jpeg",
        "/Users/matthiaspierre/Documents/newapp/finalapp/assets/event/franco/1.jpeg",
      ]
    ),
  ];

  const ArticlePage({super.key});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  int _selectedIndex = 0; // Ajoutez cette ligne pour déclarer _selectedIndex
  bool isDrawerOpen = false;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Derniers Évènements'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: IntrinsicHeight(
                child: Row(
                  children: ArticlePage.articles.map((article) => _buildArticleCard(context, article)).toList(),

                ),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
  child: NavigationRail(
    selectedIndex: _selectedIndex,
    onDestinationSelected: (index) {
      setState(() {
        _selectedIndex = index;
      });
      // Gérez la navigation ou toute autre action que vous souhaitez effectuer lorsqu'une destination est sélectionnée
    },
    labelType: NavigationRailLabelType.none, // Assurez-vous que cette propriété est correcte
    destinations: const [  ],
      // Ajoutez vos
         ), // Appeler votre fonction de création de NavigationRail
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, Article article) {

    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
        height: 250,
        width: 300,
        child: MouseRegion(
          onHover: (event) {
      },

      onExit: (event) {
      },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 5,
              ),
            ),
            child: Material(
              animationDuration: const Duration(milliseconds: 500),
              borderRadius: BorderRadius.circular(10),
              elevation: 8,
              shadowColor: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleDetailPage(
                        article: article,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          article.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              article.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              article.summary,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class ArticleDetailPage extends StatefulWidget {
  final Article article;

  const ArticleDetailPage({
    super.key,
    required this.article,
  });

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {

  final PageController _pageController = PageController();
  late Timer _timer;

  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == 
          widget.article.imagePaths.length - 1) {
        _pageController.animateToPage(
          0, 
          duration: const Duration(milliseconds: 500), 
          curve: Curves.easeInOut
        );
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500), 
          curve: Curves.easeInOut
        );
      }
    });

  }

  @override 
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: 
      
      LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
          
                // PageView des images
                Expanded(
                  flex: 3,
                  child: PageView(
                    controller: _pageController,
                    children: widget.article.imagePaths.map((path) {
                      return Image.asset(
                        path,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),

                // Titre
                Expanded( 
                  flex: 1,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.article.title,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),  
                ),
          
                // Contenu
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.article.content,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );

  }

} 
