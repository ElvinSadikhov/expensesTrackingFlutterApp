// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
    return Consumer<ThemeState>(
      builder: (context, ThemeState themeState, _) {
        return Card( 
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(this.borderRadiusValue),
              side: BorderSide(width: 1.5, color: themeState.isDark() ? ColorConsts.white : ColorConsts.black,)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(this.borderRadiusValue),
            child: Image.network(this.imageLink, 
              fit: BoxFit.cover,
              height: this.height,
              width: this.width,
            ),
          ),
        );
      }, 
    );
  }
}