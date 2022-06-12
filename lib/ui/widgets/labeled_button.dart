// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:flutter/material.dart';

class LabeledButton extends StatefulWidget {
  final Function() onTap;
  final String label;
  final Color backgroundColor;
  final double borderRadiusValue;
  final double labelSize;
  final double horizontalPadding;
  final double verticalPadding;

  const LabeledButton({ Key? key,
    required this.onTap, 
    required this.label,  
    this.borderRadiusValue = 10, 
    this.backgroundColor = ColorConsts.white, 
    this.labelSize = 20, 
    this.horizontalPadding = 30, 
    this.verticalPadding = 10, 
  }) : super(key: key);

  @override
  State<LabeledButton> createState() => _LabeledButtonState();
}

class _LabeledButtonState extends State<LabeledButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, 
      child: Container( 
        child: Card( 
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadiusValue),
              side: const BorderSide(width: 2, color: ColorConsts.black)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
            child: Text(
              widget.label,
                style: TextStyleConsts.buttonLabelStyle.copyWith(fontSize: widget.labelSize),
            ),
          ), 
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5.0,
              offset: const Offset(0, 2),
              spreadRadius: 0.00001,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
      )
    ); 
  } 
}