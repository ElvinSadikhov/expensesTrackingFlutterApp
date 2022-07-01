// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';  
import 'package:flutter/material.dart';


class DifferenceIndicator extends StatelessWidget {
  final double priceDifferenceInPercentage;
  final double iconSize;

  const DifferenceIndicator({ Key? key, 
    required this.priceDifferenceInPercentage, 
    this.iconSize = SizeConsts.differenceIndicatingIconSize 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [
        Text(
          "${this.priceDifferenceInPercentage} %",
          style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),
        ),
        Icon(
          this.priceDifferenceInPercentage < 0 
            ? Icons.arrow_downward_rounded
            : this.priceDifferenceInPercentage > 0 
              ? Icons.arrow_upward_rounded
              : Icons.remove,
          color: this.priceDifferenceInPercentage < 0 
            ? ColorConsts.green
            : this.priceDifferenceInPercentage > 0 
              ? ColorConsts.red
              : ColorConsts.grey, 
          size: this.iconSize
        )
      ],
    );
  }
}