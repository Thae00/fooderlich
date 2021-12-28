import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  FriendPostListView({required this.friendPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      // 3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 4
          Text('Social Chefs 👩‍🍳',
              style: Theme.of(context).textTheme.headline1),
          // 5
          SizedBox(height: 16),
          //  Add PostListView here
          ListView.separated(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index){
              final post = friendPosts[index];
              return FriendPostTitle(post: post);
            },
            separatorBuilder: (context, index){
              return SizedBox(height: 16,);
            },
          ),
          // 6
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
