import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/settings_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ThemeSettings extends StatelessWidget {
  const ThemeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
          ),
          Consumer<ThemeState>(
            builder: (context, ThemeState themeState, _) {
              return Switch.adaptive(
                value: themeState.isDark(), 
                onChanged: (_) {
                  themeState.toggleTheme();
                }
              );
            }, 
          ),
        ],
      )
    );
  }
}