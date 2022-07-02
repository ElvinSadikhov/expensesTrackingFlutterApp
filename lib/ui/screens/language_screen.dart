// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/providers/locale_state.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leftIcon: CustomBackButton(buildContext: context), label: AppLocalizations.of(context)!.language),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.horizontalPadding),
        child: Column(
          children: [
            Row(
              children: [
                Radio(    
                  value: 1, 
                  groupValue: this._getGroupValue(context),
                  onChanged: (int? value) {
                    setState(() { 
                      Provider.of<LocaleState>(context, listen: false).setLocale(const Locale('en'));
                    });
                  }
                ),
                Text(
                  AppLocalizations.of(context)!.english, 
                  style: Theme.of(context).textTheme.headline1
                ), 
              ],
            ),
            Row(
              children: [
                Radio(    
                  value: 2, 
                  groupValue: this._getGroupValue(context),
                  onChanged: (int? value) {
                    setState(() { 
                      Provider.of<LocaleState>(context, listen: false).setLocale(const Locale('ru'));
                    });
                  }
                ),
                Text(
                  AppLocalizations.of(context)!.russian, 
                  style: Theme.of(context).textTheme.headline1
                ), 
              ],
            )
          ],
        ),
      ),
    );
  }

  int _getGroupValue(BuildContext context) {
    switch (Provider.of<LocaleState>(context, listen: false).locale.toString()) {
      case 'en':
        return 1; 
      case 'ru':
        return 2; 
      default:
        return -1;
    }
  }
} 