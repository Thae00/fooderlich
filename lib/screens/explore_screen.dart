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
    // TODO 1: Add TodayRecipeListView FutureBuilder
    return const Center(
      child: Text('Explore Screen'),
    );
  }
}
