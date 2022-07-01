import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:expenses_tracking_app/ui/widgets/account_info_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
      child: Column(
        children: [
          const AccountInfoBlock(),
          ElevatedButton(
            onPressed: () {
              Provider.of<ThemeState>(context, listen: false).toggleTheme();
            }, 
            child: Text("press me")
          ),
        ],
      ), 
    );
  }
}