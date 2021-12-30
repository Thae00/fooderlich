import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace and add layout widgets
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add empty image
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset("assets/sample_pics/empty_list.png"),
              ),
            ),
            // Add empty screen title
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 15,
            ),
            // Add empty screen subtitleconst SizedBox(height: 16.0),
            Text(
              'Shopping for ingredients?\n'
              'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            // Add browse recipes button
            MaterialButton(
              onPressed: () {
                // Go to Recipes Tab
                Provider.of<TabManager>(context, listen: false).gotoRecipes();
              },
              child: Text(
                'Browse Recipes',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              textColor: Colors.white,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
