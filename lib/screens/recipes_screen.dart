import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //Add RecipesGridView Here
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
