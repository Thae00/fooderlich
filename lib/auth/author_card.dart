import 'package:flutter/material.dart';
import 'package:fooderlich/auth/profile.dart';
import 'package:fooderlich/theme/fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  AuthorCard(
      {required this.authorName, required this.title, this.imageProvider});

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;
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
                imageProvider: widget.imageProvider,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                ],
              )
            ],
          ),
          //2: add IconButton
          IconButton(
            onPressed: () {
              // const snackBar = SnackBar(content: Text("Favorite Pressed!"));
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
