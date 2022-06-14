// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/font_size_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/app_bar_label_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget? leftIcon;
  final Widget? rightIcon;
  // final BuildContext? buildContext;
  // final SearchDelegate<ProductWidget>? searchDelegate;
  final String label;
  final double fontSize;
  final Color backgroundColor;   

  const CustomAppBar({Key? key,
    this.label = "",
    this.leftIcon, 
    this.rightIcon, 
    // this.buildContext, 
    // this.searchDelegate, 
    this.fontSize = FontSizeConsts.kDefaultAppBarLabelSize, 
    this.backgroundColor = ColorConsts.white,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size; 
    
    return SafeArea(
      child: Container(
        color: this.backgroundColor,
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
              // this.buildContext != null ? CustomBackButton(buildContext: this.buildContext!) : Container(),
              // this.searchDelegate != null ? SearchButton(searchDelegate: this.searchDelegate!) : Container(),
              AppBarLabelWidget(label: this.label, fontSize: this.fontSize), 
            ] 
          ),
        ),
      ),
    );
  }

  @override 
  Size get preferredSize => const Size.fromHeight(SizeConsts.appBarHeight);
}