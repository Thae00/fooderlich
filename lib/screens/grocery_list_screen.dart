import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_title.dart';
import 'package:fooderlich/models/grocery_manager.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  GroceryListScreen({required this.manager});

  @override
  Widget build(BuildContext context) {
    // Replace with listView
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];

          // TODO 28: Wrap in a Dismissable
          // TODO 27: Wrap in an InkWell
          return GroceryTitle(
            item: item,
            onComplete: (change) {
              if (change != null) {
                manager.completeItem(index, change);
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16,
          );
        },
      ),
    );
  }
}
