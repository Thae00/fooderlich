import 'package:flutter/material.dart';
import 'package:fooderlich/theme/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mag2.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            // 5: add dark overlay BoxDecoration
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            // 6: Add Container, Column, Icon and Text
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
            // 7: Add Center widget with Chip widget children
          ],
        ),
      ),
    );
  }
}
