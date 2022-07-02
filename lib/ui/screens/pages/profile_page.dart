import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/providers/locale_state.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:expenses_tracking_app/ui/widgets/account_info_block.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/settings_box.dart';
import 'package:expenses_tracking_app/ui/widgets/language_settings.dart';
import 'package:expenses_tracking_app/ui/widgets/theme_settings.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [ 
            const AccountInfoBlock(),
            WidgetMethods.verticalSpace(50),
            const ThemeSettings(), 
            const LanguageSettings(), 
          ],
        ),
      ), 
    );
  }
}