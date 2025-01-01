import 'package:car_app/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Contants.imageAsset(imageName),
      fit: BoxFit.cover,
    );
  }
}
