// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/data/product.dart';
import 'package:expenses_tracking_app/ui/widgets/product_widget.dart';
import 'package:flutter/material.dart';


class SearchButton extends StatelessWidget {
  final SearchDelegate<ProductWidget>? searchDelegate;
  
  const SearchButton({ Key? key, required this.searchDelegate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.searchDelegate != null  
      ? Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            showSearch<ProductWidget>(
              context: context, 
              delegate: this.searchDelegate!,
            );
          }, 
          icon: const Icon(
            Icons.search_rounded, 
            size: SizeConsts.kDefaultAppBarButtonSize,
          )
        ),
      )
        : Container();
  }
}