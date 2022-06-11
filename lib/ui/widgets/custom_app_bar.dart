// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/font_size_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/data/product.dart';
import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/widgets/app_bar_label_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/search_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final BuildContext? buildContext;
  final SearchDelegate<ProductWidget>? searchDelegate;
  final String label;
  final double fontSize;
  final Color backgroundColor;   

  const CustomAppBar({Key? key,
    required this.label,
    this.buildContext, 
    this.searchDelegate, 
    this.fontSize = FontSizeConsts.kDefaultAppBarLabelSize, 
    this.backgroundColor = ColorConsts.white,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size; 
    
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        color: this.backgroundColor,
        height: this.fontSize + 15,
        width: sizeOfScreen.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.horizontalPadding),
          child: Stack(
            children: [
              CustomBackButton(buildContext: this.buildContext),
              SearchButton(searchDelegate: this.searchDelegate),
              AppBarLabelWidget(label: this.label, fontSize: this.fontSize), 
            ] 
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(SizeConsts.appBarHeight);
}