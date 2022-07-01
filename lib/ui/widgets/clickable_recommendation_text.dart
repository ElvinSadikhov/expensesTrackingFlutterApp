// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/consts/color_consts.dart'; 
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableRecommendationText extends StatelessWidget {
  final String nonclickableText;
  final String clickableText;
  final Function() onTap;

  const ClickableRecommendationText({ Key? key, 
    required this.nonclickableText, 
    required this.clickableText, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: this.nonclickableText,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
          ),
          TextSpan(
            text: this.clickableText, 
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 14, 
              fontWeight: FontWeight.w500, 
              color: ColorConsts.blue, 
              fontStyle: FontStyle.italic, 
              decoration: TextDecoration.underline
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = this.onTap,
          ),
        ]
      ),
    );
  }
}