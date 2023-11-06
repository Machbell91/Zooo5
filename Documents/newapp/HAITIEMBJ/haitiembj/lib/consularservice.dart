import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './layout/footer.dart';
import './layout/header.dart';
import '../main.dart';

class Article {
  final String titleKey;
  final String contentKey;
  final String summaryKey;
  final String link;
  final String imgPath;
  final List<String> imagePaths;

  const Article({
    required this.imgPath,
    required this.titleKey,
    required this.contentKey,
    required this.summaryKey,
    required this.link,
    required this.imagePaths,
  });
}

class InformationPages extends StatefulWidget {
  final Article article;
  final Function(Locale) onLanguageChanged;
  final Locale locale;

  const InformationPages({
    super.key,
    required this.article,
    required this.onLanguageChanged,
    required this.locale,
  });

  @override
  _InformationPagesState createState() => _InformationPagesState();
}

class _InformationPagesState extends State<InformationPages> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
        if (_pageController.hasClients) {
          if (_pageController.page == widget.article.imagePaths.length - 1) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
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

  String getTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case 'titreconsulat0':
        return AppLocalizations.of(context)?.titreconsulat0?? '';
      case 'titreconsulat1':
        return AppLocalizations.of(context)?.titreconsulat1 ?? '';
      case 'titreconsulat2':
        return AppLocalizations.of(context)?.titreconsulat2 ?? '';
      case 'titreconsulat3':
        return AppLocalizations.of(context)?.titreconsulat3 ?? '';
      case 'titreconsulat4':
        return AppLocalizations.of(context)?.titreconsulat4 ?? '';
      case 'titreconsulat5':
        return AppLocalizations.of(context)?.titreconsulat5 ?? '';
      case 'titreconsulat6':
        return AppLocalizations.of(context)?.titreconsulat6 ?? '';
      case 'titreconsulat7':
        return AppLocalizations.of(context)?.titreconsulat7 ?? '';
      case 'titreconsulat8':
        return AppLocalizations.of(context)?.titreconsulat8 ?? '';
      case 'titreconsulat9':
        return AppLocalizations.of(context)?.titreconsulat9 ?? '';
      default:
        return '';
    }
  }

  String getContent(BuildContext context, String summaryKey) {
    switch (summaryKey) {
      case 'texteconsulat0':
        return AppLocalizations.of(context)?.texteconsulat0?? '';
      case 'texteconsulat1':
        return AppLocalizations.of(context)?.texteconsulat1 ?? '';
      case 'texteconsulat2':
        return AppLocalizations.of(context)?.texteconsulat2 ?? '';
      case 'texteconsulat3':
        return AppLocalizations.of(context)?.texteconsulat3 ?? '';
      case 'texteconsulat4':
        return AppLocalizations.of(context)?.texteconsulat4 ?? '';
      case 'texteconsulat5':
        return AppLocalizations.of(context)?.texteconsulat5 ?? '';
      case 'texteconsulat6':
        return AppLocalizations.of(context)?.texteconsulat6 ?? '';
      case 'texteconsulat7':
        return AppLocalizations.of(context)?.texteconsulat7 ?? '';
      case 'texteconsulat8':
        return AppLocalizations.of(context)?.texteconsulat8 ?? '';
      case 'texteconsulat9':
        return AppLocalizations.of(context)?.texteconsulat9 ?? '';
      default:
        return '';
    }
  }

@override
Widget build(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  int increasedHeight = screenHeight.round() * 2;

  return Scaffold(
    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: increasedHeight.toDouble(),
        ),
        child: SizedBox(
          height: increasedHeight.toDouble(),
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
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.article.imagePaths.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        'assets/other/consula.jpeg',
                        fit: BoxFit.contain,
                      );
                    },
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
    ),
    
  );
}
  void onComplete(Locale newLocale) {}
}
