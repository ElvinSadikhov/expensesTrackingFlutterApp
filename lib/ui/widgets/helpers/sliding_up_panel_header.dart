import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:flutter/material.dart';


class SlidingUpPanelHeader extends StatelessWidget {
  const SlidingUpPanelHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      width:  MediaQuery.of(context).size.width,  
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: 7,
              width: 60,
              color: ColorConsts.grey,
            ),
          )
        ),
      ),
    );
  }
}