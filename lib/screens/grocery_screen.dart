import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    //  Add a scaffold widget
    return EmptyGroceryScreen();
  }
  // Add buildGroceryScreen
  Widget buildGroceryScreen() {
    // 1
    return Consumer<GroceryManager>(
      // 2
      builder: (context, manager, child) {
      // 3
      if (manager.groceryItems.isNotEmpty) {
        // TODO 25: Add GroceryListScreen
        return Container();
      } else {
        // 4
        return EmptyGroceryScreen();
      }
    },
    );
  }

}