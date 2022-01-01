import 'package:flutter/material.dart';
import 'package:fooderlich/models/fooderlich_pages.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

import 'explore_screen.dart';
import 'grocery_screen.dart';
import 'recipes_screen.dart';

class Home extends StatefulWidget {
  //  Home MaterialPage Helper
  static MaterialPage page(int currentTab) {
    return MaterialPage(
        name: FooderlichPages.home,
        key: ValueKey(FooderlichPages.home),
        child: Home(currentTab: currentTab));
  }

  final int currentTab;
  Home({required this.currentTab});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Wrap Consumer for AppStateManager
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              profileButton(),
            ],
          ),
          body: IndexedStack(index: widget.currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              //  Update user's selected tab
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
        // Add closing },);
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: () {
          //  home -> profile
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfile(true);
        },
      ),
    );
  }
}
