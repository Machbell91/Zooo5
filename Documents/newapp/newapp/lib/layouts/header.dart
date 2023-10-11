import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
