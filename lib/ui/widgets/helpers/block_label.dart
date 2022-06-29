// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart'; 
import 'package:flutter/material.dart'; 


class BlockLabel extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;

  const BlockLabel({ Key? key, 
    required this.title, 
    this.subtitle = Strings.seeAll, 
    this.onTap 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(this.title, 
          style: TextStyleConsts.blockTitleStyle,
        ),
        GestureDetector(
          onTap: this.onTap,
          child: Text(this.subtitle, 
            style: TextStyleConsts.blockSubtitleStyle,
          ),
        )
      ],
    );
  }
}