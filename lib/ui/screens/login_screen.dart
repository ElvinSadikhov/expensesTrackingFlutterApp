import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart'; 
import 'package:expenses_tracking_app/ui/screens/registration_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/clickable_recommendation_text.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart'; 
import 'package:expenses_tracking_app/ui/widgets/login_form.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: AppLocalizations.of(context)!.logIn),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
          child: Column(
            children: [   
              const LoginForm(padding: EdgeInsets.symmetric(horizontal: 30),),
              WidgetMethods.verticalSpace(30),
              ClickableRecommendationText(
                nonclickableText: AppLocalizations.of(context)!.registrationRecommendation, 
                clickableText: AppLocalizations.of(context)!.createAnAccountExclamatory,
                onTap: () {
                  debugPrint('Create an account has been clicked');
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                  );
                },
              ), 
            ]
          ),
        ),
      ),
    );
  }
}