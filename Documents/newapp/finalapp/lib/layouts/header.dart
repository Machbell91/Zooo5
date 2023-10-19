import 'package:flutter/material.dart';


class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          padding:const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/flaghaiti.png',
                height: 40,
                width: 40,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 15),
              const Text(
                'AMBASSADE HAITI AU JAPON',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}
