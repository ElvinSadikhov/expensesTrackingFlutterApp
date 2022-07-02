import 'package:expenses_tracking_app/config/app_themes.dart';
import 'package:expenses_tracking_app/l10n/l10n.dart'; 
import 'package:expenses_tracking_app/providers/locale_state.dart';  
import 'package:expenses_tracking_app/providers/theme_state.dart'; 
import 'package:expenses_tracking_app/ui/screens/login_screen.dart';
import 'package:expenses_tracking_app/ui/screens/main_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';  

 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Consumer2<LocaleState, ThemeState>(
      builder: (context, LocaleState localeState, ThemeState themeState, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppThemes.lightTheme.copyWith(textTheme: AppThemes.getTextTheme(isDark: themeState.isDark())),
          darkTheme: AppThemes.darkTheme.copyWith(textTheme: AppThemes.getTextTheme(isDark: themeState.isDark())),
          themeMode: themeState.themeMode,
          home: const MainScreen(), // LoginScreen()
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: localeState.locale,
        ); 
      },
    );
  }
} 

