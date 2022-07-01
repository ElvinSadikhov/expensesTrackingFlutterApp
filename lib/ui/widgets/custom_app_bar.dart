// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/font_size_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/app_bar_label_widget.dart'; 
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget? leftIcon;
  final Widget? rightIcon; 
  final String? label;
  final double fontSize;
  final Color? backgroundColor;   

  const CustomAppBar({Key? key,
    this.label,
    this.leftIcon, 
    this.rightIcon,  
    this.fontSize = FontSizeConsts.kDefaultAppBarLabelSize, 
    this.backgroundColor  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size; 
    
    return SafeArea(
      child: Container(
        color: this.backgroundColor ?? Theme.of(context).backgroundColor,
        height: this.fontSize + 30,
        width: sizeOfScreen.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.horizontalPadding),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: this.leftIcon != null ? this.leftIcon! : Container()
              ),
              Align(
                alignment: Alignment.centerRight,
                child: this.rightIcon != null ? this.rightIcon! : Container()
              ),
              AppBarLabelWidget(label: this.label ?? "", fontSize: this.fontSize), 
            ] 
          ),
        ),
      ),
    );
  }

  @override 
  Size get preferredSize => const Size.fromHeight(SizeConsts.appBarHeight);
}