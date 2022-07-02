// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsBox extends StatelessWidget {
  final Widget child;

  const SettingsBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, ThemeState themeState, _) {
        return Card( 
          color: themeState.isDark() ? ColorConsts.grey : ColorConsts.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(width: 1, color: themeState.isDark() ? ColorConsts.white : ColorConsts.black)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: SizedBox( 
              width: MediaQuery.of(context).size.width,
              child: this.child
            ),
          ), 
        );
      },  
    );
  }
}