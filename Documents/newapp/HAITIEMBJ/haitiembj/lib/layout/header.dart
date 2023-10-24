import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Kreyol',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Français',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '日本',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '한글',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '中国语文',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flaghaiti.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "AMBASSADE",
                      style: TextStyle(
                        fontSize: 20.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "D'HAÏTI",
                      style: TextStyle(
                        fontSize: 20.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3, width: 3),
                    Text(
                      "AU JAPON",
                      style: TextStyle(
                        fontSize: 20.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "L'union",
                      style: TextStyle(
                        fontSize: 15.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Fait",
                      style: TextStyle(
                        fontSize: 15.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "La force",
                      style: TextStyle(
                        fontSize: 15.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Bodoni moda',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HAÏTI AU JAPON',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Ambassade d'Haïti au Japon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0 * (MediaQuery.of(context).size.width / 1200),
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      'assets/japanflag.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Rechercher',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Animation gradient
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: SizedBox(
              height: 5,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.blue],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

