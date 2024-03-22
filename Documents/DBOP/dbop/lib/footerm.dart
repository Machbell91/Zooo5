import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('© 2024 DBOP'),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.facebook),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.instagram),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
