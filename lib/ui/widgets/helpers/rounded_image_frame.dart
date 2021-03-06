// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedImageFrame extends StatelessWidget {
  final double size;
  final ImageProvider<Object> image;

  const RoundedImageFrame({Key? key, required this.size, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, ThemeState themeState, _) {
        return Container(
          height: this.size,
          width: this.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: themeState.isDark() ? ColorConsts.white : ColorConsts.black, width: 1)
          ),
          child: Center(
            child: Container(
              height: this.size * 0.85,
              width: this.size * 0.85,
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                image: DecorationImage(
                  image: this.image,
                  fit: BoxFit.cover
                )
              ), 
            ),
          ),
        );
      }, 
    );
  }
}