// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:flutter/material.dart';
 

class SearchAppBar extends CustomAppBar {
  final BuildContext? buildContext;
  final SearchDelegate<ProductShortcut?> searchDelegate; 
  
  SearchAppBar({ Key? key,  
    required this.searchDelegate,
    String? label,  
    this.buildContext,
  }) : super(key: key, 
        leftIcon: buildContext != null ? CustomBackButton(buildContext: buildContext) : null, 
        label: label, 
        rightIcon: SearchButton(searchDelegate: searchDelegate)
      ); 
} 