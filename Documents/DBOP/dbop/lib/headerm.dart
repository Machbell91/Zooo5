import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Accueil'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('À propos'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
