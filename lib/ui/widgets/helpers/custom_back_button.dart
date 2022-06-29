// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:flutter/material.dart'; 

class CustomBackButton extends StatelessWidget {

  final BuildContext buildContext;
  final double buttonSize; 
  final Color color;
  
  const CustomBackButton({ Key? key, 
    required this.buildContext, 
    this.buttonSize = SizeConsts.kDefaultAppBarButtonSize, 
    this.color = ColorConsts.black, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        Navigator.pop(this.buildContext);
      },
      child: Icon(Icons.arrow_back, size: this.buttonSize, color: this.color,)
    );
  }
}