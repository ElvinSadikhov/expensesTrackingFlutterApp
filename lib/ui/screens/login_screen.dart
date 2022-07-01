import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart';
import 'package:expenses_tracking_app/ui/screens/registration_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/clickable_recommendation_text.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart'; 
import 'package:expenses_tracking_app/ui/widgets/login_form.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(label: Strings.logIn),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
          child: Column(
            children: [   
              const LoginForm(padding: EdgeInsets.symmetric(horizontal: 30),),
              WidgetMethods.verticalSpace(30),
              ClickableRecommendationText(
                nonclickableText: Strings.registrationRecommendation, 
                clickableText: Strings.createAnAccountExclamatory,
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