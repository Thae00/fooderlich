import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_item.dart';

class GroceryTitle extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTitle({
    required this.item,
    this.onComplete,
  }) : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    // Change this widget
    return Container(
      height: 100,
      // Replace this color
      color: Colors.red,
    );
  }
  //Add BuildImportance()
  //Add buildDate()
  //Add buildCheckbox()
}
