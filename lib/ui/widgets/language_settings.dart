import 'package:expenses_tracking_app/ui/screens/language_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/settings_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageSettings extends StatelessWidget {
  const LanguageSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: GestureDetector(
          child: Text(
            AppLocalizations.of(context)!.language, 
            style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600)
          ),
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) =>  const LanguageScreen())
            );
          },
        ),
      )
    );
  }
}