// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:flutter/material.dart';
 

class SearchAppBar extends StatelessWidget {
  final BuildContext? buildContext;
  final SearchDelegate<ProductShortcut> searchDelegate;
  final String? label;
  
  const SearchAppBar({ Key? key,  
    required this.searchDelegate, 
    this.label,
    this.buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leftIcon: this.buildContext != null ? CustomBackButton(buildContext: this.buildContext!) : null, 
      label: this.label ?? "", 
      rightIcon: SearchButton(searchDelegate: this.searchDelegate),
    );
  }
} 