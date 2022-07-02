// ignore_for_file: unnecessary_this  
import 'package:flutter/material.dart'; 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlockLabel extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function()? onTap;

  const BlockLabel({ Key? key, 
    required this.title, 
    this.subtitle, 
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
          child: Text(this.subtitle ?? AppLocalizations.of(context)!.seeAll, 
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}