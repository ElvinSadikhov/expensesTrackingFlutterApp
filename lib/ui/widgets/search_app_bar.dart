// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/font_size_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/app_bar_label_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/product_widget.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:flutter/material.dart';


// TODO: gotta do somtheing with this

class SearchAppBar extends StatelessWidget {
  final BuildContext? buildContext;
  final SearchDelegate<ProductWidget> searchDelegate;
  final String label;
  
  const SearchAppBar({ Key? key,  
    required this.searchDelegate, 
    required this.label,
    this.buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leftIcon: this.buildContext != null ? CustomBackButton(buildContext: this.buildContext!) : null, 
      label: this.label, 
      rightIcon: SearchButton(searchDelegate: this.searchDelegate),
    );
  }
} 