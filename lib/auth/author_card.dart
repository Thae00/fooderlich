import 'package:flutter/material.dart';
import 'package:fooderlich/auth/profile.dart';
import 'package:fooderlich/theme/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  AuthorCard(
      {required this.authorName, required this.title, this.imageProvider});

  @override
  Widget build(BuildContext context) {
    //Replace return container(...);
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        //add alignment
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileImage(
                imageRadius: 20,
                imageProvider: imageProvider,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                ],
              )
            ],
          ),
          //2: add IconButton
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(content: Text("Favorite Pressed!"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
