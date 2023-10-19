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

class ArticlePage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: "Grand Bazar annuel du GRULAC",
      imgPath: "assets/1.jpeg",
      summary: "Le dimanche 23 octobre 2022",
      content: "Le dimanche 23 octobre 2022, l’Ambassade de la République d'Haïti au Japon a pris part à l'organisation du Grand Bazar annuel du GRULAC (Group of Latin America and the Caribbean). À l’occasion de cette belle journée de célébration, la culture haïtienne (art, artisanat, musique et gastronomie) a été mise en valeur.",
      imagePaths: [
        "assets/image1_1.jpg",
        "assets/image1_2.jpg",
      ]

    ),
    Article(
      title: "MIKABEN", 
      imgPath: "assets/2.jpeg",
      summary: "Ayiti pèdi yon pitit li ki te renmen l anpil.",
      content: "Ayiti pèdi yon pitit li ki te renmen l anpil. Travay atis la reflete lanmou li pou Ayiti. Pou sa, mèsi Mikaben. N'ap sonje w etènèlman atravè zèv ou yo.Kouraj pou nou chak ki afekte ak nan lapèn. Rest in Power Michael Benjamin!",
      imagePaths: [
        "assets/image1_1.jpg",
        "assets/image1_2.jpg",
      ]
    ),
    Article(
      title: "Kids Forest",
      imgPath: "assets/3.jpeg",
      summary: "le 16 août 2022 ",
      content: "L’Ambassade d’Haïti au Japon a reçu le 16 août 2022 la visite des élèves du programme de garde après école « Kids Forest ». La Mission a réalisé une belle journée de d’interaction avec les élèves et les enseignants de Kids Forest. Le groupe, treize élèves âgés entre 7 et 10 ans et quatre enseignants, est arrivé à l’Ambassade dans l’après-midi. Une séance de présentation sur l’histoire, la culture et les traditions haïtiennes a eu lieu dans la salle de conférence, puis le groupe a effectué une visite guidée des locaux de la Mission avant de prendre congé.Cette visite s’inscrit dans le cadre de l’objectif de la Mission de promouvoir les richesses culturelles et historiques d’Haïti auprès des jeunes japonais.  En effet, ces opportunités d’échange et de partage permettent aux jeunes de découvrir d’autres cultures et ouvrir leurs horizons sur le monde.",
      imagePaths: [
        "assets/image1_1.jpg",
        "assets/image1_2.jpg",
      ]
    ),
    Article(
      title: "GRULAC",
      imgPath: "assets/4.jpg",
      summary: " 20 et 22 juin 2022",
      content: "’Ambassadeur de la République d’Haïti au Japon, M. Helph Monod HONORAT, a pris part, les 20 et 22 juin 2022, à une rencontre de haut niveau organisée par le Ministre des Affaires Étrangères du Japon, S.E.M.  Yoshimasa HAYASHI, avec les chefs de mission du groupe des Pays Latino-américains et Caribéens (GRULAC). Cette initiative s’inscrit dans l’objectif de présenter l’agenda diplomatique du Japon aux missions des pays de l’Amérique Latine et de la Caraïbe pour l’année fiscale 2022-2023. Le Ministre HAYASHI qui était accompagné de la directrice générale de la région de l’Amérique Latine et des Caraïbes, Ambassadeur Maki KOBAYASHI, en a profité pour remercier les pays latino-américains et caribéens de leur soutien à la suite de l’élection du Japon au Conseil de Sécurité des Nations Unies durant la période 2023-2024 comme membre non-permanent.  Il a renouvelé l’engagement et la disponibilité du gouvernement japonais à poursuivre et à renforcer ses   efforts de soutien aux Pays Latino-américains et Caribéens à travers des projets de coopération technique, l’envoi d’experts et le financement pour le développement.  Il a également souligné l’importance pour le Japon du GRULAC qui regroupe des partenaires importants avec lesquels le Japon partage des valeurs fondamentales comme la démocratie et les droits humains. L’Ambassadeur HONORAT, dans son intervention, a saisi l’occasion pour mettre en exergue l’efficacité de la coopération japonaise en Haïti tout en présentant, au nom du Gouvernement haïtien, ses mots de gratitude pour l’intérêt particulier que le Japon porte à Haïti. Il a formulé, en outre, son souhait de voir la coopération japonaise inclure, dans un avenir proche, des investissements relatifs à la culture, la science, l’innovation et la technologie pouvant contribuer à la modernisation des infrastructures et au   développement durable d’Haïti. L'ambassadeur a aussi fait remarquer que l’appui du Japon sera toujours très utile aux pays de la Caraïbe pour   résoudre des problèmes liés au réchauffement climatique et aux catastrophes naturelles.",
      imagePaths: [
        "assets/image1_1.jpg",
        "assets/image1_2.jpg",
      ]
    ),
    Article(
      title: "Francophonie",
      imgPath: "assets/4.jpg",
      summary: "Célébration du mois de la francophonie 2022",
      content: "Le vendredi 25 Mars 2022, dans une ambiance conviviale, l’Ambassade de la République d'Haïti au Japon a organisé la projection du film “Gouverneurs de la Rosée dans le cadre du “mois de la francophonie. À l’occasion de cette belle soirée de célébration, la culture haïtienne (art, artisanat, musique et gastronomie) a été mise en valeur.",
      imagePaths: [
        "assets/image1_1.jpg",
        "assets/image1_2.jpg",
      ]
    ),
  ];

  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des articles")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: IntrinsicHeight(
                child: Row(
                  children: articles.map((article) => _buildArticleCard(context, article)).toList(),
                ),
              ),
            ),  
          );
        },
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context, Article article) {
    return SizedBox(
      height: 250,
      width: 300,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article: article),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
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
              )
            ],
          ),
        ),
      ),
    );
  }
}


class ArticleDetailPage extends StatefulWidget {
  final Article article;

  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final PageController _pageController = PageController();
  late Timer _timer;

  int _selectedIndex = 0;
  int _selectedIndexHovered = -1;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (_pageController.page == widget.article.imagePaths.length - 1) {
          _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        } else {
          _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget buildNavigationRail() {
    return NavigationRail(
      labelType: NavigationRailLabelType.none,
      selectedIndex: _selectedIndexHovered == -1 ? _selectedIndex : _selectedIndexHovered,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          _selectedIndexHovered = -1;
        });
      },
      destinations: buildNavigationDestinations(),
    );
  }

  List<NavigationRailDestination> buildNavigationDestinations() {
    return [
      buildNavigationDestination("Accueil", Icons.home),
      buildNavigationDestination("Actualité", Icons.article),
      buildNavigationDestination("Ambassade", Icons.account_balance),
      buildNavigationDestination("Présence Haïtienne", Icons.diversity_3),
      buildNavigationDestination("Relation Bilatérales", Icons.diversity_2),
      buildNavigationDestination("Espace Presse", Icons.folder_copy),
      buildNavigationDestination("Venir En Haïti", Icons.airplane_ticket),
      buildNavigationDestination("Découvrir Haïti", Icons.visibility),
    ];
  }

  NavigationRailDestination buildNavigationDestination(String label, IconData icon) {
    return NavigationRailDestination(
      icon: MouseRegion(
        child: Tooltip(
          message: label,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
              ),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: Colors.white, // Couleur du texte de l'icône
            ),
          ),
        ),
        onEnter: (_) {
          setState(() {
            _selectedIndexHovered = _selectedIndex;
          });
        },
        onExit: (_) {
          setState(() {
            _selectedIndexHovered = -1;
          });
        },
      ),
      label: _selectedIndexHovered == -1 ? const SizedBox.shrink() : Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: buildNavigationRail(),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    // PageView
                    Expanded(
                      flex: 2,
                      child: PageView(
                        controller: _pageController,
                        children: widget.article.imagePaths.map((path) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => Scaffold(
                                    body: Center(
                                      child: Image.asset(
                                        path,
                                        width: 300,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  path,
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    // Titre
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              widget.article.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Contenu
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),

                            Container(
                              width: constraints.maxWidth * 0.85,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                                child: Text(
                                  widget.article.content,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}