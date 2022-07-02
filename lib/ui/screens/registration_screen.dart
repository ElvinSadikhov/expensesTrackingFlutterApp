import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/login_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/clickable_recommendation_text.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart'; 
import 'package:expenses_tracking_app/ui/widgets/registration_form.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: CustomAppBar(label: AppLocalizations.of(context)!.registration, leftIcon: CustomBackButton(buildContext: context)),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: Column(
          children: [  
            WidgetMethods.verticalSpace(30),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const RegistrationForm(padding: EdgeInsets.symmetric(horizontal: 30),),
                  WidgetMethods.verticalSpace(30),
                  ClickableRecommendationText(
                    nonclickableText: AppLocalizations.of(context)!.loginRecommendation, 
                    clickableText: AppLocalizations.of(context)!.logInExclamatory,
                    onTap: () {
                      debugPrint('Login (testSpan) has been clicked');
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                  )
                ],
              ),
            )
            
          ]
        ),
      ),
    );
  }
}