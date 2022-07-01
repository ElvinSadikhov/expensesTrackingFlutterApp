// ignore_for_file: unnecessary_this
 
import 'package:flutter/material.dart';


class AppBarLabelWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  
  const AppBarLabelWidget({ Key? key, required this.label, required this.fontSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.label,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: this.fontSize)
      ),
    );
  }
}