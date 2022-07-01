// ignore_for_file: unnecessary_this 
import 'package:expenses_tracking_app/consts/strings.dart'; 
import 'package:flutter/material.dart'; 


class BlockLabel extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;

  const BlockLabel({ Key? key, 
    required this.title, 
    this.subtitle = Strings.seeAll, 
    this.onTap 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(this.title, 
          style: Theme.of(context).textTheme.headline5!,
        ),
        GestureDetector(
          onTap: this.onTap,
          child: Text(this.subtitle, 
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}