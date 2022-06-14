// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:flutter/material.dart';


class ImageBox extends StatelessWidget {
  final double borderRadiusValue;
  final String imageLink;
  final double height;
  final double width;

  const ImageBox({ Key? key, 
    this.borderRadiusValue = SizeConsts.productShortcutBorderRadius, 
    required this.imageLink, 
    required this.height, 
    required this.width 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( 
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.borderRadiusValue),
          side: const BorderSide(width: 1.5, color: ColorConsts.black)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(this.borderRadiusValue),
        child: Image.network(this.imageLink, 
          fit: BoxFit.cover,
          height: this.height,
          width: this.width,
        ),
      ),
    );
  }
}