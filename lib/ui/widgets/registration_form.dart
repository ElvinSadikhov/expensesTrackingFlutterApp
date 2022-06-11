// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/screens/home_screen.dart';
import 'package:expenses_tracking_app/ui/screens/login_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/custom_text_form_field.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart'; 
import 'package:expenses_tracking_app/utils/helpers/validators/login_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/validators/registration_validator.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
 
class RegistrationForm extends StatefulWidget { 
  final EdgeInsets padding;
  
  const RegistrationForm({ Key? key, this.padding = EdgeInsets.zero }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationForm();
}

class _RegistrationForm extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController(); 
  TextEditingController usernameController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController(); 
  TextEditingController confirmPasswordController = TextEditingController(); 


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Form(
          key: this._formKey,
          child: Padding(
            padding: widget.padding,
            child: Column(
              children: [
                // TODO: listview buildernen elemek
                CustomTextFormField(
                  controller: this.firstNameController, 
                  hintText: Strings.firstName, 
                  validator: (value) => RegistrationValidator.validateFirstName(value),
                  labelText: Strings.firstName,    
                ),    
                CustomTextFormField(
                  controller: this.lastNameController, 
                  hintText: Strings.lastName, 
                  validator: (value) => RegistrationValidator.validateLastName(value),
                  labelText: Strings.lastName,     
                ),  
                CustomTextFormField(
                  controller: this.emailController, 
                  hintText: Strings.email, 
                  validator: (value) => RegistrationValidator.validateGmail(value),
                  labelText: Strings.email,    
                ),  
                CustomTextFormField(
                  controller: this.usernameController, 
                  hintText: Strings.username, 
                  validator: (value) => RegistrationValidator.validateUsername(value),
                  labelText: Strings.username,     
                ),  
                CustomTextFormField(
                  controller: this.passwordController, 
                  hintText: Strings.password, 
                  validator: (value) => RegistrationValidator.validatePassword(value),
                  labelText: Strings.password,    
                  obscureText: true,
                ), 
                CustomTextFormField(
                  controller: this.confirmPasswordController, 
                  hintText: Strings.confirmPassword, 
                  validator: (value) => RegistrationValidator.validateConfirmPassword(value, passwordController: this.passwordController),
                  labelText: Strings.confirmPassword,   
                  textInputAction: TextInputAction.done,  
                  obscureText: true, 
                ),
              ]
            ),
          )
        ),
        WidgetMethods.verticalSpace(20),
        LabeledButton(
          onTap: () { 
            this.onFormCompleted();
          }, 
          label: Strings.createAnAccount,  
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

