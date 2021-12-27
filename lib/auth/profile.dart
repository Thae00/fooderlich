import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  final double imageRadius;
  final ImageProvider? imageProvider;
  ProfileImage({this.imageRadius = 20, this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
