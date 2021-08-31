import 'package:flutter/material.dart';
import 'package:plane_app/shared/theme.dart';

class PhotosItem extends StatelessWidget {
  final String imageUrl;

  PhotosItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    );
  }
}
