// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/ui/screens/login_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/custom_text_form_field.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart';  
import 'package:expenses_tracking_app/utils/helpers/validators/registration_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
 
class RegistrationForm extends StatefulWidget { 
  final EdgeInsets padding;
  
  const RegistrationForm({ Key? key, this.padding = EdgeInsets.zero }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController(); 
  // TextEditingController usernameController = TextEditingController(); 
  // TextEditingController passwordController = TextEditingController(); 
  // TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  
  final List<TextEditingController> _controllers = [
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
    TextEditingController(text: ""),
  ];

  List<String> _texts({required BuildContext context}) => [
    AppLocalizations.of(context)!.firstName,
    AppLocalizations.of(context)!.lastName,
    AppLocalizations.of(context)!.gmail,
    AppLocalizations.of(context)!.username,
    AppLocalizations.of(context)!.password,
    AppLocalizations.of(context)!.confirmPassword
  ]; 

  final List<dynamic> _validators = [
    RegistrationValidator.validateFirstName,
    RegistrationValidator.validateLastName,
    RegistrationValidator.validateGmail,
    RegistrationValidator.validateUsername,
    RegistrationValidator.validatePassword,
    RegistrationValidator.validateConfirmPassword
  ];

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Column(
      children: [
        Form(
          key: this._formKey,
          child: Padding(
            padding: widget.padding,
            child: SizedBox(
              // height: sizeOfScreen.height * 0.5,
              child: Column(
                children: [
                  ...List.generate(this._controllers.length, (index) => index).map(
                    (index) {
                      return CustomTextFormField(
                        controller: this._controllers[index], 
                        validator: (value) => index == this._controllers.length - 1 
                          ? this._validators[index](value, passwordController: this._controllers[index - 1]) 
                            : this._validators[index](value),
                        hintText: this._texts(context: context)[index],
                        labelText: this._texts(context: context)[index],
                        obscureText: index >= this._controllers.length - 2 ? true : false,
                        textInputAction: index == this._controllers.length - 1 ? TextInputAction.done : TextInputAction.next,
                      );
                    }
                  )
                ],
              )   
            )
          )
        ),
        WidgetMethods.verticalSpace(20),
        LabeledButton(
          onTap: this.onFormCompleted, 
          label: AppLocalizations.of(context)!.createAnAccount,  
        ),  
      ],
    );

  }

  void onFormCompleted() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The account has been created successfully!"))); 
    } 
  }
 

} 

