import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    // 2
    //  1: Add TodayRecipeListView FutureBuilder
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Add nested list Views
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              SizedBox(
                height: 16,
              ),
              //Replace this with FriendPostListView
              Container(
                height: 400,
                color: Colors.green,
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
